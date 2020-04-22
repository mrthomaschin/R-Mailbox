#define F_CPU 8000000UL		/* Define CPU Frequency e.g. here its 8MHz */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <util/delay.h>

#include "ir.h"
#include "servo.h"

volatile unsigned char TimerFlag = 0; // TimerISR() sets this to 1. C programmer should clear to 0.

// Internal variables for mapping AVR's ISR to our cleaner TimerISR model.
unsigned long _avr_timer_M = 1; // Start count from here, down to 0. Default 1ms
unsigned long _avr_timer_cntcurr = 0; // Current internal count of 1ms ticks


enum States_UnlockTop {isLockedTop, unlockTop, isUnlockedTop, lockTop} state_unlock1;
enum States_UnlockBottom {isLockedBottom, unlockBottom, isUnlockedBottom, lockBottom} state_unlock2;
enum States_Sensor{sensor_start, input} state_sensor;


/*****************************/
/**********TIMER ISR**********/
/*****************************/

// Set TimerISR() to tick every M ms
void TimerSet(unsigned long M) {
	_avr_timer_M = M;
	_avr_timer_cntcurr = _avr_timer_M;
}

void TimerOn() {
	// AVR timer/counter controller register TCCR1
	TCCR1B 	= 0x0B;	// bit3 = 1: CTC mode (clear timer on compare)
	// bit2bit1bit0=011: prescaler /64
	// 00001011: 0x0B
	// SO, 8 MHz clock or 8,000,000 /64 = 125,000 ticks/s
	// Thus, TCNT1 register will count at 125,000 ticks/s

	// AVR output compare register OCR1A.
	OCR1A 	= 125;	// Timer interrupt will be generated when TCNT1==OCR1A
	// We want a 1 ms tick. 0.001 s * 125,000 ticks/s = 125
	// So when TCNT1 register equals 125,
	// 1 ms has passed. Thus, we compare to 125.
	// AVR timer interrupt mask register

	TIMSK1 	= 0x02; // bit1: OCIE1A -- enables compare match interrupt

	//Initialize avr counter
	TCNT1 = 0;

	// TimerISR will be called every _avr_timer_cntcurr milliseconds
	_avr_timer_cntcurr = _avr_timer_M;

	//Enable global interrupts
	SREG |= 0x80;	// 0x80: 1000000
}

void TimerOff() {
	TCCR1B 	= 0x00; // bit3bit2bit1bit0=0000: timer off
}

void TimerISR() {
	TimerFlag = 1;
}

// In our approach, the C programmer does not touch this ISR, but rather TimerISR()
ISR(TIMER1_COMPA_vect)
{
	// CPU automatically calls when TCNT0 == OCR0 (every 1 ms per TimerOn settings)
	_avr_timer_cntcurr--; 			// Count down to 0 rather than up to TOP
	if (_avr_timer_cntcurr == 0) { 	// results in a more efficient compare
		TimerISR(); 				// Call the ISR that the user uses
		_avr_timer_cntcurr = _avr_timer_M;
	}
}

/*****************************/
/********STATE MACHINE********/
/*****************************/

void Sensor() //Detects if mailbox contains parcel
{
	switch(state_sensor) //Transitions
	{
		case sensor_start:
		state_sensor = input;
		break;

		case input:
		state_sensor = input;
		break;

	}

	switch(state_sensor) //Actions
	{
		case sensor_start:
		break;

		case input:
		break;

	}

}

void UnlockTop() //Locks & unlocks letter mail door
{
	switch(state_unlock1) //Transitions
	{
		case isLockedTop:
		if(1) //If authenticated
		state_unlock1 = unlockTop;
		else
		state_unlock1 = isLockedTop;

		break;

		case unlockTop:
		state_unlock1 = isUnlockedTop;

		break;

		case isUnlockedTop:
		if(packageIsDetectedTop() /*and TODO: door is shut*/) //If package is detected and door is shut
		state_unlock1 = lockTop;
		else
		state_unlock1 = isUnlockedTop;

		break;

		case lockTop:
		state_unlock1 = isLockedTop;

		break;

		default:
		break;
	}

	switch(state_unlock1) //Actions
	{
		case isLockedTop:
		break;

		case unlockTop:
		servoUnlockTop(); //Run servoUnlock function in servo.c

		break;

		case isUnlockedTop:
		break;

		case lockTop:
		servoLockTop(); //Run servoLock function in servo.c

		break;

	}

}

void UnlockBottom() //Locks & unlocks parcel door
{
	switch(state_unlock2) //Transitions
	{
		case isLockedBottom:
		if(1) //If authenticated
		state_unlock2 = unlockBottom;
		else
		state_unlock2 = isLockedBottom;

		break;

		case unlockBottom:
		state_unlock2 = isUnlockedBottom;

		break;

		case isUnlockedBottom:
		if(packageIsDetectedBottom() /*and TODO: door is shut*/) //If package is detected and door is shut
		state_unlock2 = lockBottom;
		else
		state_unlock2 = isUnlockedBottom;

		break;

		case lockBottom:
		state_unlock2 = isLockedBottom;

		break;

		default:
		break;
	}

	switch(state_unlock2) //Actions
	{
		case isLockedBottom:
		break;

		case unlockBottom:
		servoUnlockBottom(); //Run servoUnlock function in servo.c

		break;

		case isUnlockedBottom:
		break;

		case lockBottom:
		servoLockBottom(); //Run servoLock function in servo.c

		break;

	}

}

/*****************************/
/************MAIN*************/
/*****************************/


int main(void)
{
	DDRA = 0x00; PORTA = 0xFF; //IR Sensor input A0 - A7
	DDRB = 0x00; PORTB = 0xFF;
	DDRC = 0xFF; PORTC = 0x00;
	DDRD = 0XFF; PORTD = 0X00; //Servo motor input / output

	DDRD |= (1 << PD5);				// PWM OC1A pins as output
	TCNT1 = 0;						// Set timer1 count zero
	ICR1 = 2499;

	TCCR1A = (1<<WGM11)|(1<<COM1A1); //Non-inverted PWM
	TCCR1B = (1<<WGM12)|(1<<WGM13)|(1<<CS10)|(1<<CS11); //Fast PWM

	TimerSet(70);
	TimerOn();

	state_unlock1 = isUnlockedTop; //Initial mailbox door unlocked, no packages inside
	state_unlock2 = isUnlockedBottom; //Initial mailbox door unlocked, no packages inside
	state_sensor = sensor_start;

	while (1)
	{
		while(!TimerFlag);
		TimerFlag = 0;
	}
}
