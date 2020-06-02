#define F_CPU 8000000UL

#include <avr/io.h>
#include "timer.h"
#include "scheduler.h"
#include "servo.h"
#include "ir.h"
#include "servo.h"
#include "main.h"
#include "spi.h"
#define E_FAIL (-1)
#define S_OK (0)

//PC1 is authorization signal from security Pi, Debug Button on PA0 mocks authorization signal to unlock
#define AUTHORIZED (~PINC & 0x02) | (~PINA & 0x01)
//Button on PA1 tells us the package is outgoing mail
#define OUTGOING_PRESSED ~PINC & 0x01

//Current Command transmission from the Raspberry Pi
unsigned char transmission = 0x00;
//Command from RPi to put sensor status on SPDR
#define Send_Status 0x10
//Command from RPi to authorize user and unlock the door
#define Unlock_Door 0x20

//IR sensor signals, 0 if nothing detected, 1 if something is
unsigned char isPackage = 0;
unsigned char doorClosed = 0;

//The user is placing outgoing mail into the compartment. Raise the flag
unsigned char isOutgoing = 0;

//This is the security flag. This is set to 1 in the ISR if the Pi commands us to unlock the door. It is reset to 0 in the lock tick after we unlock the door
unsigned char authorized = 0;

ISR(SPI_STC_vect)
{
	transmission = SPDR;

	switch (transmission)
	{
	case Send_Status:
		if (!isPackage)
		{
			SPI_Transmit(0x00);
		}
		else if (isPackage && !isOutgoing && doorClosed)
		{
			SPI_Transmit(0x01);
		}
		else if (isPackage && isOutgoing && doorClosed)
		{
			SPI_Transmit(0x02);
		}
		else
		{
			SPI_Transmit(0x03);
		}
		break;

	case Unlock_Door:
		authorized = 1;
		SPI_Transmit(transmission);
		break;

	default:
		break;
	}
}

enum packageIR_States
{
	Detect_Package
};
int packageIR_Tick(int packageIR_state)
{
	//State Transitions
	switch (packageIR_state)
	{
	case Detect_Package:
		packageIR_state = Detect_Package;
		break;

	default:
		packageIR_state = Detect_Package;
		break;
	}

	//State Actions
	switch (packageIR_state)
	{
	case Detect_Package:
		isPackage = detectPackage();
		//	PORTD = isPackage;
		break;

	default:
		break;
	}

	return packageIR_state;
}

enum doorIR_States
{
	Detect_Door
};
int doorIR_Tick(int doorIR_state)
{
	//State Transitions
	switch (doorIR_state)
	{
	case Detect_Door:
		doorIR_state = Detect_Door;
		break;

	default:
		doorIR_state = Detect_Door;
		break;
	}

	//State Actions
	switch (doorIR_state)
	{
	case Detect_Door:
		doorClosed = detectDoor();
		//	PORTD = doorClosed;
		break;

	default:
		break;
	}

	return doorIR_state;
}

enum lock_States
{
	Unlocked,
	Lock,
	Locked,
	Unlock
};
int lock_Tick(int lock_state)
{
	//State Transitions
	switch (lock_state)
	{
	case Unlocked:
		if (isPackage && doorClosed)
		{

			lock_state = Lock;
			//PORTD = lock_state;
		}
		break;

	case Lock:
		lock_state = Locked;
		break;

	case Locked:
		if (AUTHORIZED)
		{

			lock_state = Unlock;
		}

		break;

	case Unlock:
		lock_state = Unlocked;
		break;

	default:
		lock_state = Lock;
		break;
	}

	//State Actions
	switch (lock_state)
	{
	case Unlocked:
		break;

	case Lock:
		lockDoor();
		break;

	case Locked:
		break;

	case Unlock:
		unlockDoor();
		_delay_ms(1000);
		break;

	default:
		break;
	}

	return lock_state;
}

enum outgoingButton_states
{
	outgoingButton_Idle,
	outgoingButton_Press,
	outgoingButton_Release
};
int outgoingButton_Tick(int outgoingButton_state)
{
	//State Transitions
	switch (outgoingButton_state)
	{
	case outgoingButton_Idle:
		if (OUTGOING_PRESSED)
		{
			outgoingButton_state = outgoingButton_Press;
		}
		break;

	case outgoingButton_Press:
		if (!(OUTGOING_PRESSED))
		{
			outgoingButton_state = outgoingButton_Release;
		}
		break;

	case outgoingButton_Release:
		outgoingButton_state = outgoingButton_Idle;
		break;

	default:
		outgoingButton_state = outgoingButton_Idle;
		break;
	}

	//State Actions
	switch (outgoingButton_state)
	{
	case outgoingButton_Idle:
		break;

	case outgoingButton_Press:
		break;

	case outgoingButton_Release:
		//Can't change status if door is locked to prevent tampering
		if (!doorClosed)
		{
			//Toggle flag. User will press to signify outgoing mail, Mailman will press to signify mail has been picked up. User can also cancel mail by pressing the button
			isOutgoing = !isOutgoing;
		}
		break;

	default:
		break;
	}

	return outgoingButton_state;
}

enum flag_states
{
	flag_Lowered,
	flag_Raised
};
int flag_Tick(int flag_state)
{
	//State Transitions
	switch (flag_state)
	{
	case flag_Lowered:
		if (isOutgoing)
		{
			flag_state = flag_Raised;
		}
		break;

	case flag_Raised:
		if (!isOutgoing)
		{
			flag_state = flag_Lowered;
		}
		break;

	default:
		flag_state = flag_Lowered;
		break;
	}

	//State Actions
	switch (flag_state)
	{
	case flag_Lowered:
		lowerFlag();
		break;

	case flag_Raised:
		raiseFlag();
		break;

	default:
		break;
	}

	return flag_state;
}

/*   test cases for doorIR_Tick() function  */
int testDoorClosed()
{

	PORTA = 0x10;

	if ((doorIR_Tick(1) == 0) && !(PORTA & 0x10))
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for doorIR_Tick() function  */
int testDoorOpen()
{

	PORTA = 0x00;

	if ((doorIR_Tick(1) == 0) && (PORTA & 0x10))
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackagePresent()
{

	PORTA = 0x02;

	if ((packageIR_Tick(1) == 0) && !(PORTA & 0x02))
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackageNot()
{

	PORTA = 0x00;

	if ((packageIR_Tick(1) == 0) && (PORTA & 0x02))
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function */
int testDoorLock()
{

	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x02;

	if (packageIR_Tick(1) == 0)
	{

		PINA = 0x04;

		if (doorIR_Tick(1) == 0)
		{

			if (!(lock_Tick(0) == 1))
			{

				return E_FAIL;
			}
		}
	}

	return S_OK;
}

/*   test cases for lock_Tick() function */
int testStayLocked()
{

	if (lock_Tick(1) == 3)
	{
		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for lock_Tick() function */
int testUnlock()
{

	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x01;

	if (lock_Tick(2) != 3)
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for lock_Tick() function */
int testUnlocked()
{

	if (lock_Tick(3) != 0)
	{

		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function */
int testPackageDoorNotLock()
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x02;

	if (packageIR_Tick(1) == 0)
	{

		PINA = 0x00;

		if (doorIR_Tick(1) == 0)
		{

			if ((lock_Tick(0) == 1))
			{

				return E_FAIL;
			}
		}
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function */
int testDoorDoorNotLock()
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x00;

	if (packageIR_Tick(1) == 0)
	{

		PINA = 0x04;

		if (doorIR_Tick(1) == 0)
		{

			if ((lock_Tick(0) == 1))
			{

				return E_FAIL;
			}
		}
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function */
int testNoDoorNotLock()
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x00;

	if (packageIR_Tick(1) == 0)
	{

		PINA = 0x00;

		if (doorIR_Tick(1) == 0)
		{

			if ((lock_Tick(0) == 1))
			{

				return E_FAIL;
			}
		}
	}

	return S_OK;
}

void run_tests()
{

	if (E_FAIL == testDoorClosed())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testDoorOpen())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testPackagePresent())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testPackageNot())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testDoorLock())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testStayLocked())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testUnlock())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testUnlocked())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testPackageDoorNotLock())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testDoorDoorNotLock())
	{

		PORTD = 0xFF;
	}

	if (E_FAIL == testNoDoorNotLock())
	{

		PORTD = 0xFF;
	}
}

int main(void)
{
	//PA0 - "Authorize" Mock button, PA1-3 Package IR sensors, PA4 Door IR Sensor
	DDRA = 0x00;
	PORTA = 0xFF;
	//PB3 - Servo Wire
	DDRB = 0xFF;
	PORTB = 0x00;
	//Debug light on PC0
	DDRC = 0xFF;
	PORTC = 0x00;

	DDRD = 0xFF;
	PORTD = 0x00;

	PINA = 0x01;
	// DDRB = 0xFF; PORTB = 0x00;
	// //PC0 - Outgoing Mail Button, PC1 - Authorize signal from security Pi
	// DDRC = 0x00; PORTC = 0xFF;
	// //PD6 - Debug LED, PD7 - Servo Wire
	// DDRD = 0xFF; PORTD = 0x00;

	run_tests();

	SPI_SlaveInit();
	TimerSet(1);
	TimerOn();
	lock_PWM_on();
	flag_PWM_on();
	unlockDoor();
	lowerFlag();

	// Periods for the tasks
	unsigned long packageIR_Tick_Period = 500;
	unsigned long doorIR_Tick_Period = 500;
	unsigned long lock_Tick_Period = 500;
	unsigned long outgoingButton_Tick_Period = 250;
	unsigned long flag_Tick_Period = 500;

	static task task1, task2, task3, task4, task5;
	task *tasks[] = {&task1, &task2, &task3, &task4, &task5};
	const unsigned short numTasks = sizeof(tasks) / sizeof(task *);

	// Task 1
	task1.state = Detect_Package;
	task1.period = packageIR_Tick_Period;
	task1.elapsedTime = packageIR_Tick_Period;
	task1.TickFct = &packageIR_Tick;

	// Task 2
	task2.state = Detect_Door;
	task2.period = doorIR_Tick_Period;
	task2.elapsedTime = doorIR_Tick_Period;
	task2.TickFct = &doorIR_Tick;

	// Task 3
	task3.state = Unlocked;
	task3.period = lock_Tick_Period;
	task3.elapsedTime = lock_Tick_Period;
	task3.TickFct = &lock_Tick;

	// Task 4
	task4.state = outgoingButton_Idle;
	task4.period = outgoingButton_Tick_Period;
	task4.elapsedTime = outgoingButton_Tick_Period;
	task4.TickFct = &outgoingButton_Tick;

	// Task 5
	task5.state = flag_Lowered;
	task5.period = flag_Tick_Period;
	task5.elapsedTime = flag_Tick_Period;
	task5.TickFct = &flag_Tick;

	unsigned short i; // Scheduler for-loop iterator
	while (1)
	{
		// Scheduler code
		for (i = 0; i < numTasks; i++)
		{
			// Task is ready to tick
			if (tasks[i]->elapsedTime == tasks[i]->period)
			{
				// Setting next state for task
				tasks[i]->state = tasks[i]->TickFct(tasks[i]->state);
				// Reset the elapsed time for next tick.
				tasks[i]->elapsedTime = 0;
			}

			tasks[i]->elapsedTime += 1;
		}
		while (!TimerFlag)
			;
		TimerFlag = 0;
	}

	return 0;
}
