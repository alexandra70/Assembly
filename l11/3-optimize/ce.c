#include<stdint.h>
#include<stdio.h>
#include<sys/time.h>

#define N (100 * 1000 * 1000)
intmax_t a;

void doSomething(int i)
{
    a += i;
    return;
}

 void doSomethingElse(int i)
{
    a += i + 2;
    return;
}
 void doYetSomethingElse(int i)
{
    a += i * 3 + 2;
    return;
}

int main()
{
    int i;
    int var;
    long elapsed;
    struct timeval t0, t1;

    printf("Insert an integer:\n");
    scanf("%d", &var);

    gettimeofday(&t0, NULL);
    for (i = 0; i < N; i++)
    {
        if (var % 2 == 0)
            doSomething(i);
        else if (var % 3 == 0)
            doSomethingElse(i);
        else
            doYetSomethingElse(i);
    }
    gettimeofday(&t1, NULL);

    elapsed = (t1.tv_sec - t0.tv_sec)*1000000 + t1.tv_usec - t0.tv_usec;
    printf("[Non-optimized] Computed: %jd in: %ld us\n", a, elapsed);

    a = 0;
    gettimeofday(&t0, NULL);

    // TODO: optimize the above code here

    gettimeofday(&t1, NULL);

    elapsed = (t1.tv_sec - t0.tv_sec)*1000000 + t1.tv_usec - t0.tv_usec;
    printf("[Optimized] Computed: %jd in: %ld us\n", a, elapsed);

    return 0;
}
