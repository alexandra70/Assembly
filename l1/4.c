#include <stdio.h>

void rotate_left(unsigned int *number, int bits)
{
	*number = (*number << bits) | (*number >> (32 - bits));
}

void rotate_right(unsigned int *number, int bits)
{
	*number = (*number >> bits) | (*number << (32 - bits));
}

int main()
{
	/* TODO: Test functions */
	unsigned int n1 = 0x80000000;
	rotate_left(&n1, 1);
	printf("%d\n", n1);

	unsigned int n2 = 0x00000001;
	rotate_right(&n2, 16);
	printf("%d\n", n2);
	return 0;
}