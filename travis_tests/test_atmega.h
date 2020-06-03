#ifndef ATMEGA_SRC_H_
#define ATMEGA_SRC_H_

#include <stdio.h>
#include <avr/io.h>

#define E_FAIL (-1)
#define S_OK (0)

/*   test cases for doorIR_Tick() function  */
int testDoorClosed()
{

    PORTA = 0x10;

    if ((doorIR_Tick(1) == 0) && !(PORTA & 0x10))
    {

        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for doorIR_Tick() function  */
int testDoorOpen()
{

    PORTA = 0x00;

    if ((doorIR_Tick(1) == 0) && (PORTA & 0x10))
    {

        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function  */
int testPackagePresent()
{

    PORTA = 0x02;

    if ((packageIR_Tick(1) == 0) && !(PORTA & 0x02))
    {

        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function  */
int testPackageNot()
{

    PORTA = 0x00;

    if ((packageIR_Tick(1) == 0) && (PORTA & 0x02))
    {

        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function */
int testDoorLock()
{

    DDRA = 0xFF;
    PORTA = 0x00;
    PINA = 0x02;

    if (packageIR_Tick(1) == 0)
    {

        PINA = 0x04;

        if (doorIR_Tick(1) == 0)
        {

            if (!(lock_Tick(0) == 1))
            {

                return E_FAIL;
            }
        }
    }

    return S_OK;
};

/*   test cases for lock_Tick() function */
int testStayLocked()
{

    if (lock_Tick(1) == 3)
    {
        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for lock_Tick() function */
int testUnlock()
{

    DDRA = 0xFF;
    PORTA = 0x00;
    PINA = 0x01;

    if (lock_Tick(2) != 3)
    {

        return E_FAIL;
    }

    return S_OK;
}

/*   test cases for lock_Tick() function */
int testUnlocked()
{

    if (lock_Tick(3) != 0)
    {

        return E_FAIL;
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function */
int testPackageDoorNotLock()
{
    DDRA = 0xFF;
    PORTA = 0x00;
    PINA = 0x02;

    if (packageIR_Tick(1) == 0)
    {

        PINA = 0x00;

        if (doorIR_Tick(1) == 0)
        {

            if ((lock_Tick(0) == 1))
            {

                return E_FAIL;
            }
        }
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function */
int testDoorDoorNotLock()
{
    DDRA = 0xFF;
    PORTA = 0x00;
    PINA = 0x00;

    if (packageIR_Tick(1) == 0)
    {

        PINA = 0x04;

        if (doorIR_Tick(1) == 0)
        {

            if ((lock_Tick(0) == 1))
            {

                return E_FAIL;
            }
        }
    }

    return S_OK;
};

/*   test cases for packageIR_Tick() function */
int testNoDoorNotLock()
{
    DDRA = 0xFF;
    PORTA = 0x00;
    PINA = 0x00;

    if (packageIR_Tick(1) == 0)
    {

        PINA = 0x00;

        if (doorIR_Tick(1) == 0)
        {

            if ((lock_Tick(0) == 1))
            {

                return E_FAIL;
            }
        }
    }

    return S_OK;
};

void run_tests()
{

    //PA0 - "Authorize" Mock button, PA1-3 Package IR sensors, PA4 Door IR Sensor
    DDRA = 0x00;
    PORTA = 0xFF;
    //PB3 - Servo Wire
    DDRB = 0xFF;
    PORTB = 0x00;
    //PC0 - Outgoing Mail Button, PC1 - Authorize signal from security Pi
    DDRC = 0x00;
    PORTC = 0xFF;
    //PD6 - Debug LED, PD7 - Servo Wire
    DDRD = 0xFF;
    PORTD = 0x00;

    if (E_FAIL == testDoorClosed())
    {

        PORTD = 0xFF;
    }

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
    }
};

#endif