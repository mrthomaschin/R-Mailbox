#include "ir.h"

bool packageIsDetectedTop()
{
	if((PINA & 0x01) == 0x00)
		return true;
		
	return false;
}

bool packageIsDetectedBottom()
{
	if((PINA & 0x02) == 0x00)
	return true;
	
	return false;
}