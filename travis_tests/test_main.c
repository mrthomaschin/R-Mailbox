#include <stdio.h>
#include "../atmega_src/main.h"

#define S_OK (0)
#define E_FAIL (-1)

int run_tests()
{
    int x = 1;
    int y = 3;

    if (x + y == 3)
    {
        return S_OK;
    }
    else
    {
        printf("Test failed\n");
        return E_FAIL;
    }
}

int main()
{
    printf("Hello, World!\n");

    int result;

    result = run_tests();

    return result;
}