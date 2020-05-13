#include <avr/io.h>

int main(void)
{
	DDRA = 0x00; PORTA = 0xFF; // PA0 is sensor input
	DDRB = 0xFF; PORTB = 0x00; // PB0 is LED output
	
	unsigned char led = 0x00;
	unsigned char sensor = 0x00;
	while(1)
	{
		sensor = ~PINA & 0x01; // sensor is connected to A0
		
		if (sensor) { 
			led = (led & 0xFC) | 0x01; 

		}
		else {
			led = (led & 0xFC) | 0x02; 

		}

		PORTB = led;
	}
}



