#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>

#define N (250 * 1000)
#define ARRAY_ITEMS 100

unsigned int bitarray[ARRAY_ITEMS];

int count_bits(unsigned int bitarray[], int nitems)
{
    // int i;
    // int result;
    // unsigned int item;

    // result = 0;
    // for (i = 0; i < nitems; i++) {
    //     item = bitarray[i];

    //     while (item != 0) {
    //         if (item % 2 != 0)
    //             result++;
    //         item = item >> 1;
    //     }
    // }

    int i;
    int result;
    //unsigned int item;

    result = 0;

   __asm__(
    "xor ecx, ecx\n"
    "xor eax, eax\n"
    "xor ebx, ebx\n"
    "label:\n"
    "mov edx, [%1 + 4*ecx - 4]\n"
    "popcnt ebx, edx\n"
    "add eax, ebx\n"
    "inc ecx\n"
    "cmp ecx, %2\n"
    "jle label\n"
    "mov %0, eax\n"
    :"=r" (result)
    :"r" (bitarray), "r" (nitems)
    : "eax", "ebx", "ecx", "edx");

    return result;
}

int count_bits_op(unsigned int bitarray[], int nitems)
{
    return count_bits(bitarray, nitems);
}

int main(void)
{
    int i, result;
    long elapsed;
    struct timeval t0, t1;

    srandom(time(NULL));
    for (i = 0; i < ARRAY_ITEMS; i++)
        bitarray[i] = random();

    gettimeofday(&t0, NULL);
    for (i = 0; i < N; i++) {
        result = count_bits(bitarray, ARRAY_ITEMS);
    }
    gettimeofday(&t1, NULL);

    elapsed = (t1.tv_sec - t0.tv_sec)*1000000 + t1.tv_usec - t0.tv_usec;
    printf("[Non-optimized] Result: %d in %ld us\n", result, elapsed);

    gettimeofday(&t0, NULL);
    for (i = 0; i < N; i++) {
        result = count_bits_op(bitarray, ARRAY_ITEMS);
    }
    gettimeofday(&t1, NULL);

    elapsed = (t1.tv_sec - t0.tv_sec)*1000000 + t1.tv_usec - t0.tv_usec;
    printf("[Optimized]     Result: %d in %ld us\n", result, elapsed);

    return 0;
}
