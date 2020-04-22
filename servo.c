#include "servo.h"

void servoLockTop()
{
	OCR1A & 0x01 = 65; //TODO: Set value - Can you isolate each pin?
	_delay_ms(1000);
}

void servoUnlockTop()
{
	OCR1A & 0x01= 175; //TODO: Set value
	_delay_ms(1000);
}

void servoLockBottom()
{
	OCR1A & 0x02 = 65; //TODO: Set value
	_delay_ms(1000);
}

void servoUnlockBottom()
{
	OCR1A & 0x02 = 175; //TODO: Set value
	_delay_ms(1000);
}