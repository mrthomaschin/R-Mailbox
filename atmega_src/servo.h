#ifndef SERVO_H
#define SERVO_H

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

void set_lock_PWM(double frequency) 
{
	static double current_frequency; // Keeps track of the currently set frequency
	// Will only update the registers when the frequency changes, otherwise allows
	// music to play uninterrupted.
	if (frequency != current_frequency) {
		if (!frequency) { TCCR0B &= 0x08; } //stops timer/counter
		else { TCCR0B |= 0x03; } // resumes/continues timer/counter
		
		// prevents OCR3A from overflowing, using prescaler 64
		// 0.954 is smallest frequency that will not result in overflow
		if (frequency < 0.954) { OCR0A = 0xFF; }
		
		// prevents OCR0A from underflowing, using prescaler 64
		// 31250 is largest frequency that will not result in underflow
		else if (frequency > 31250) { OCR0A = 0x0000; }
		
		// set OCR3A based on desired frequency
		else { OCR0A = (short)(8000000 / (128 * frequency)) - 1; }

		TCNT0 = 0; // resets counter
		current_frequency = frequency; // Updates the current frequency
	}
}

void lock_PWM_on() 
{
	TCCR0A = (1 << WGM02) | (1 << WGM00) | (1 << COM0A0);
	// COM3A0: Toggle PB3 on compare match between counter and OCR0A
	TCCR0B = (1 << WGM02) | (1 << CS01) | (1 << CS00);
	// WGM02: When counter (TCNT0) matches OCR0A, reset counter
	// CS01 & CS30: Set a prescaler of 64
	set_lock_PWM(0);
}

void lock_PWM_off() {
	TCCR0A = 0x00;
	TCCR0B = 0x00;
}

void unlockDoor()
{
	set_lock_PWM(400);
	_delay_ms(1250);
	set_lock_PWM(0);
	
	return;
}

void lockDoor()
{
	set_lock_PWM(1200);
	_delay_ms(1250);
	set_lock_PWM(0);
	
	return;
}

void set_flag_PWM(double frequency) 
{
	static double current_frequency; // Keeps track of the currently set frequency
	// Will only update the registers when the frequency changes, otherwise allows
	// music to play uninterrupted.
	if (frequency != current_frequency) {
		if (!frequency) { TCCR2B &= 0x08; } //stops timer/counter
		else { TCCR2B |= 0x03; } // resumes/continues timer/counter
		
		// prevents OCR3A from overflowing, using prescaler 64
		// 0.954 is smallest frequency that will not result in overflow
		if (frequency < 0.954) { OCR2A = 0xFF; }
		
		// prevents OCR0A from underflowing, using prescaler 64
		// 31250 is largest frequency that will not result in underflow
		else if (frequency > 31250) { OCR2A = 0x0000; }
		
		// set OCR3A based on desired frequency
		else { OCR2A = (short)(8000000 / (128 * frequency)) - 1; }

		TCNT2 = 0; // resets counter
		current_frequency = frequency; // Updates the current frequency
	}
}

void flag_PWM_on() 
{
	TCCR2A = (1 << WGM22) | (1 << WGM20) | (1 << COM2A0);
	// COM3A0: Toggle PB3 on compare match between counter and OCR0A
	TCCR2B = (1 << WGM22) | (1 << CS01) | (1 << CS00);
	// WGM02: When counter (TCNT0) matches OCR0A, reset counter
	// CS01 & CS30: Set a prescaler of 64
	set_flag_PWM(0);
}

void flag_PWM_off() 
{
	TCCR2A = 0x00;
	TCCR2B = 0x00;
}

void raiseFlag()
{
	set_flag_PWM(400);
	_delay_ms(1250);
	set_flag_PWM(0);
	
	return;
}

void lowerFlag()
{
	set_flag_PWM(1200);
	_delay_ms(1250);
	set_flag_PWM(0);
	
	return;
}


#endif