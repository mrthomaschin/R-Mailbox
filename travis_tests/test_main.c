#include <stdio.h>
#include "../atmega_src/travis_ci_test_example.h"

#define S_OK (0)
#define E_FAIL (-1)

int main()
{
    printf("Hello, World!\n");

    int result;

    result = run_tests_default();

    return result;
}