#ifndef IR_H
#define IR_H

#include <avr/io.h>

//Checks first 3 IR sensors on PORTA (PA1-PA3)
unsigned char detectPackage()
{
	return (~PINA & 0x02 || ~PINA & 0x04 || ~PINA & 0x08);
}

//Checks 4th IR sensor on PA4
unsigned char detectDoor()
{
	return (~PINA & 0x10);
}

#endif