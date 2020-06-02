#include "loadCell.h"

void initialize_scale()
{
    SCK_DDR |= (1 << SCK_PIN);
    DT_DDR &= ~(1 << DT_PIN); 
    DT_On;
       
    return;
}

bool scale_isReady()
{
    return (DT_INPUT & (1 << DT_PIN)) == 0;
}

long readScale()
{
    long count = 0;

    while (!scale_isReady())
    {
        //Wait until scale can send data
    }

    for (int i = 0; i < 24; ++i)
    {
       SCK_On;
       _delay_us(2);
       
       count = count << 1;
        
       SCK_Off;
       _delay_us(2);
       
       if(DT_Read)
       {
           count++;
       }

    }
    
    SCK_On;
    _delay_us(2);
    
    SCK_Off;
    _delay_us(2);
   
    count ^= 0x800000;

    return count;
}

long getAverage(long reads)
{
   long sum = 0;
    
    for (int i = 0; i < reads; ++i)
    {
        
        sum += readScale();
    }
    
    long average = sum / reads;
	//8443300
	average -= 8650000;
	
	if (average < 0)
	{
		average = 0;
	}
    
    return average;
}