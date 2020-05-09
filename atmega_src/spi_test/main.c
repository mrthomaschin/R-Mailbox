#include <avr/io.h>
#include "timer.h"
#include "scheduler.h"

#define Send_Status 0x10 //Command from RPi to put sensor status on SPDR

unsigned short sensorValue = 0; //Holds the current value from the IR sensor

unsigned char transmission = 0; //Current Command transmission from master Raspberry Pi

void SPI_SlaveInit(void)
{
	/* Set MISO output, all others input */
	DDRB = (1 << PB6);
	/* Enable SPI */
	SPCR = (1<<SPE) | (1<<SPIE);
	
	sei();
}

void SPI_Transmit(char data)
{
	SPDR = data;
	
	while(!(SPSR & (1 << SPIF)))
	{
		
	}
	
	return;
}


ISR(SPI_STC_vect) {
	transmission = SPDR;
	
	switch (transmission)
	{
		case Send_Status:
		if (sensorValue == 0)
		{
			SPI_Transmit(0x00);
			break;
		}
		SPI_Transmit(sensorValue);
		break;
				
		default:
		break;
	}

}

enum Sensor_States { Detect } Sensor_State;

int Sensor_Tick(int state)
{
	switch(state)
	{
		case Detect:
		state = Detect;
		break;
		
		default:
		break;
	}
	
	switch(state)
	{
		case Detect:
		sensorValue = ~PINA & 0x01;		
		break;
		
		default:
		break;
	}
	
	return state;
}

int main(void)
{
	DDRA = 0x00; PORTA = 0xFF;
	
	SPI_SlaveInit();
	
	TimerSet(1);
	TimerOn();
	
	// Periods for the tasks
	unsigned long int Sensor_Tick_Period = 1000;
	
	static task task1;
	task *tasks[] = { &task1};
	const unsigned short numTasks = sizeof(tasks)/sizeof(task*);
	
	// Task 1
	task1.state = Detect;//Task initial state.
	task1.period = Sensor_Tick_Period;//Task Period.
	task1.elapsedTime = Sensor_Tick_Period;//Task current elapsed time.
	task1.TickFct = &Sensor_Tick;//Function pointer for the tick.
	
	unsigned short i; // Scheduler for-loop iterator
	while(1)
	{
		// Scheduler code
		for ( i = 0; i < numTasks; i++ )
		{
			// Task is ready to tick
			if ( tasks[i]->elapsedTime == tasks[i]->period )
			{
				// Setting next state for task
				tasks[i]->state = tasks[i]->TickFct(tasks[i]->state);
				// Reset the elapsed time for next tick.
				tasks[i]->elapsedTime = 0;
			}
			
			tasks[i]->elapsedTime += 1;
		}
		while(!TimerFlag);
		TimerFlag = 0;
	}

	return 0;
}