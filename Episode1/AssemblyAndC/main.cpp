#include "stdio.h"


#define ASSEMBLY


#ifdef ASSEMBLY

extern "C" int Sum(int a, int b);

#else

int Sum(int a, int b)
{
    return a + b;
}

#endif



int main()
{
    int a, b, sum;

    a = 3;
    b = 2;
    sum = Sum(a, b);

    printf("The sum is %d\n", sum);

    return 0;
}
