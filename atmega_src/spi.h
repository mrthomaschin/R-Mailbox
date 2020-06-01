#ifndef SPI_H
#define SPI_H

#include <avr/io.h>

void SPI_SlaveInit(void)
{
	/* Set MISO output, all others input */
	DDRB |= (1 << PB6);
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

#endif