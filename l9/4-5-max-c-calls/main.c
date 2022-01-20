#include <stdio.h>

unsigned int get_max(unsigned int *arr, unsigned int len, unsigned int *pos);

int main(void)
{
	unsigned int arr[] = { 19, 7, 129, 87, 54, 218, 67, 12, 19, 99 };
	unsigned int max;
	unsigned int adresa;

	//trimit adresa deoarece voi modifica permanent variabila adresa;
	max = get_max(arr, 10, &adresa);

	printf("max: %u\n", max);
	printf("adresa in care retin pozitia %d\n", adresa);

	return 0;
}
