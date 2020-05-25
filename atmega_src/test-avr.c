

#include <stdio.h>
#include "main.c"

#define S_OK (0)
#define E_FAIL (-1)


/* ************************************************
	simple test cases for the Atmega functions 
   ************************************************
*/


/*   test cases for doorIR_Tick() function  */
int testDoorClosed() {
	
	if (doorIR_Tick(1) != 1)
	{
		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for doorIR_Tick() function  */
int testDoorOpen() {
	
	if (doorIR_Tick(0) != 0)
	{
		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackagePresent() {
	if (packageIR_Tick(1) != 1)
	{ 
		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testPackageNot() {
	if (packageIR_Tick(0) != 0)
	{ 
		return E_FAIL;
	}

	return S_OK;
}

/*   test cases for packageIR_Tick() function  */
int testLockDoor() {
	if ((packageIR_Tick(1) != 1) && (doorIR_Tick(1) != 1) && (lock_Tick(0) != 1))
	{ 
		return E_FAIL;
	}

	return S_OK;
}



/* 	************************************************
	this is a simple test suite.  
*/

int run_tests() {
	if (E_FAIL == testDoorClosed()) {
		printf("failed testDoorClosed() \n");
		return E_FAIL;
	}

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
	
	return S_OK;
}


/* 
	This main function only runs all the test code.
    If successful it returns S_OK which is equal to the numerical value of 0.
 	Any other value is considered a failure.
 	
 */
int main()
{
	int result;
	
	printf("Running Example tests .. \n");
	result = run_tests();

	if (result == S_OK) 
		printf ("tests passed.\n");
	else
		printf ("tests failed.\n");

    return result;  /* remember the value 0 is considered passing in a travis-ci sense */

}