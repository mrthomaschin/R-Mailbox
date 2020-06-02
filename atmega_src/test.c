/*
 * test.c
 *
 * Created: 5/28/2020 12:06:00 PM
 *  Author: Christian
 */ 
#include <avr/io.h>
#define E_FAIL (-1)
#define S_OK (0)

/*   test cases for doorIR_Tick() function  */
int testDoorClosed() {
	
	setPort(16);
	
	if ((doorIR_Tick(1) == 0) && !checkSensor(4))
	{
		
		return E_FAIL;
		
	}

	return S_OK;
}

/*   test cases for doorIR_Tick() function  */
int testDoorOpen() {
	
	PORTA = 0x00;
	
	if ((doorIR_Tick(1) == 0) && (PORTA & 0x10))
	{
		
		return E_FAIL;
		
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackagePresent() {
	
	PORTA = 0x02;
	
	if ((packageIR_Tick(1) == 0) && !(PORTA & 0x02))
	{
		
		return E_FAIL;
		
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackageNot() {
	
	PORTA = 0x00;
	
	if ((packageIR_Tick(1) == 0) && (PORTA & 0x02))
	{
		
		return E_FAIL;
		
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function */  
int testDoorLock() 
{

	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x02;

	if(packageIR_Tick(1) == 0) 
	{
		
		PINA = 0x04;
		
		if(doorIR_Tick(1) == 0) 
		{
			
			if(!(lock_Tick(0) == 1))
			{
				
				return E_FAIL;
						
			}
		} 			
	}
		
	return S_OK;
	
}

/*   test cases for lock_Tick() function */  
int testStayLocked() 
{
	
	if(lock_Tick(1) == 3)
	{
			return E_FAIL;	
	}

	return S_OK;

}

/*   test cases for lock_Tick() function */ 
int testUnlock() {

	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x01;
	
	if(lock_Tick(2) != 3)
	{
	
		return E_FAIL;
	
	}

	return S_OK;

}

/*   test cases for lock_Tick() function */
int testUnlocked() {
	
	if(lock_Tick(3) != 0)
	{
		
		return E_FAIL;
		
	}

	return S_OK;

}

/*   test cases for packageIR_Tick() function */  
int testPackageDoorNotLock() 
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x02;

	if(packageIR_Tick(1) == 0)
	{
		
		PINA = 0x00;
		
		if(doorIR_Tick(1) == 0)
		{
			
			if((lock_Tick(0) == 1))
			{
				
				return E_FAIL;
				
			}
		}
	}
	
	return S_OK;

}

/*   test cases for packageIR_Tick() function */
int testDoorDoorNotLock()
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x00;

	if(packageIR_Tick(1) == 0)
	{
		
		PINA = 0x04;
		
		if(doorIR_Tick(1) == 0)
		{
			
			if((lock_Tick(0) == 1))
			{
				
				return E_FAIL;
				
			}
		}
	}
	
	return S_OK;

}

/*   test cases for packageIR_Tick() function */
int testNoDoorNotLock()
{
	DDRA = 0xFF;
	PORTA = 0x00;
	PINA = 0x00;

	if(packageIR_Tick(1) == 0)
	{
		
		PINA = 0x00;
		
		if(doorIR_Tick(1) == 0)
		{
			
			if((lock_Tick(0) == 1))
			{
				
				return E_FAIL;
				
			}
		}
	}
	
	return S_OK;

}

void run_tests() 
{
		
	if (E_FAIL == testDoorClosed()) 
	{
		
		PORTD = 0xFF;		
		
	}
/*
	if (E_FAIL == testDoorOpen()) 
	{
		
		PORTD = 0xFF;
		
	}
	
	if (E_FAIL == testPackagePresent())
	{
		
		PORTD = 0xFF;
		
	}

	if (E_FAIL == testPackageNot())
	{
		
		PORTD = 0xFF;
		
	}

	if (E_FAIL == testDoorLock())
	{
		
		PORTD = 0xFF;
		
	}
	

	if (E_FAIL == testStayLocked())
	{
		
		PORTD = 0xFF;
		
	}
	

	if (E_FAIL == testUnlock())
	{
		
		PORTD = 0xFF;
		
	}

	if (E_FAIL == testUnlocked())
	{
		
		PORTD = 0xFF;
		
	}
	
	
	if (E_FAIL == testPackageDoorNotLock())
	{
		
		PORTD = 0xFF;
		
	}
	
	if (E_FAIL == testDoorDoorNotLock())
	{
		
		PORTD = 0xFF;
		
	}
	
	if (E_FAIL == testNoDoorNotLock())
	{
			
		PORTD = 0xFF;
			
	}*/
	
}
