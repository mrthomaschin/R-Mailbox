/*
 * a.c
 *
 * Created: 5/26/2020 10:10:12 PM
 *  Author: Christian
 */ 
#include <avr/io.h>
#define E_FAIL (-1)
#define S_OK (0)


/*   test cases for doorIR_Tick() function  */
int testDoorClosed() {
	
	PORTA = 0x00;
	
	if ((doorIR_Tick(1) == 0) && !(PORTA & 0x10))
	{
		
		return E_FAIL;
		
	}

	return S_OK;
}

void run_tests() {
	
	
	if (E_FAIL == testDoorClosed()) 
	{
		
		PORTD = 0xFF;		
		
	}
/*
	if (E_FAIL == testDoorOpen()) {
		printf("failed testDoorOpen() \n");
		return E_FAIL;
	}
	
	if (E_FAIL == testPackagePresent()){
		printf("failed testPackagePresent()\n");
		return E_FAIL;
	}

	if (E_FAIL == testPackageNot()){
		printf("failed testPackageNot()\n");
		return E_FAIL;
	}

	if (E_FAIL == testLockDoor()){
		printf("failed testLockDoor() \n");
		return E_FAIL;
	}
	*/
}
