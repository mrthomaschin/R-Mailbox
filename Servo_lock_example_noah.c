/*
 * please.c
 *
 * Created: 4/22/2020 10:41:16 AM
 * Author : Noah Jimenez
 */ 


#define F_CPU 8000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>


void set_PWM(double frequency) {
	static double current_frequency; // Keeps track of the currently set frequency
	// Will only update the registers when the frequency changes, otherwise allows
	// music to play uninterrupted.
	if (frequency != current_frequency) {
		if (!frequency) { TCCR0B &= 0x08; } //stops timer/counter
		else { TCCR0B |= 0x03; } // resumes/continues timer/counter
		
		// prevents OCR3A from overflowing, using prescaler 64
		// 0.954 is smallest frequency that will not result in overflow
		if (frequency < 0.954) { OCR0A = 0xFFFF; }
		
		// prevents OCR0A from underflowing, using prescaler 64
		// 31250 is largest frequency that will not result in underflow
		else if (frequency > 31250) { OCR0A = 0x0000; }
		
		// set OCR3A based on desired frequency
		else { OCR0A = (short)(8000000 / (128 * frequency)) - 1; }

		TCNT0 = 0; // resets counter
		current_frequency = frequency; // Updates the current frequency
	}
}

void PWM_on() {
	TCCR0A = (1 << WGM02) | (1 << WGM00) | (1 << COM0A0);
	// COM3A0: Toggle PB3 on compare match between counter and OCR0A
	TCCR0B = (1 << WGM02) | (1 << CS01) | (1 << CS00);
	// WGM02: When counter (TCNT0) matches OCR0A, reset counter
	// CS01 & CS30: Set a prescaler of 64
	set_PWM(0);
}

void PWM_off() {
	TCCR0A = 0x00;
	TCCR0B = 0x00;
}

void set_PWM2(double frequency) {
	static double current_frequency; // Keeps track of the currently set frequency
	// Will only update the registers when the frequency changes, otherwise allows
	// music to play uninterrupted.
	if (frequency != current_frequency) {
		if (!frequency) { TCCR2B &= 0x08; } //stops timer/counter
		else { TCCR2B |= 0x03; } // resumes/continues timer/counter
		
		// prevents OCR3A from overflowing, using prescaler 64
		// 0.954 is smallest frequency that will not result in overflow
		if (frequency < 0.954) { OCR2A = 0xFFFF; }
		
		// prevents OCR0A from underflowing, using prescaler 64
		// 31250 is largest frequency that will not result in underflow
		else if (frequency > 31250) { OCR2A = 0x0000; }
		
		// set OCR3A based on desired frequency
		else { OCR2A = (short)(8000000 / (128 * frequency)) - 1; }

		TCNT2 = 0; // resets counter
		current_frequency = frequency; // Updates the current frequency
	}
}

void PWM_on2() {
	TCCR2A = (1 << WGM22) | (1 << WGM20) | (1 << COM2A0);
	// COM3A0: Toggle PB3 on compare match between counter and OCR0A
	TCCR2B = (1 << WGM22) | (1 << CS01) | (1 << CS00);
	// WGM02: When counter (TCNT0) matches OCR0A, reset counter
	// CS01 & CS30: Set a prescaler of 64
	set_PWM2(0);
}

void PWM_off2() {
	TCCR2A = 0x00;
	TCCR2B = 0x00;
}

int main(void)
{
	DDRB = 0xFF; PORTB = 0x00;
	DDRD = 0xFF; PORTD = 0x00;
	DDRC = 0x00; PORTC = 0xFF;
	PWM_on();
	PWM_on2();
	unsigned char button1 = 0; //first lock
	unsigned char button2 = 0; //second lock
	unsigned char button3 = 0; //both locks
	set_PWM2(990);
	while (1)
	{
		button1 = PINC & 0x01;
		button2 = PINC & 0x02;
		button3 = PINC & 0x04;
		if(button1 == 0 && button3 != 4)
		{
			set_PWM(500);
			_delay_ms(1000);
		}
		if(button1 == 1)
		{
			set_PWM(980);
			_delay_ms(1000);
		}
		if(button2 == 0 && button3 != 4)
		{
			set_PWM2(520);
			_delay_ms(1000);
		}
		if(button2 == 2)
		{
			set_PWM2(1837);
			_delay_ms(1000);
		}
		if(button3 == 4)
		{
			set_PWM(990);
			//_delay_ms(1000);
			set_PWM2(1837);
			_delay_ms(1000);
		}
		
	}
}

