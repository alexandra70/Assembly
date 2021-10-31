
#include <stdio.h>

void main(void)
{
	int v[] = {4, 1, 2, -17, 15, 22, 6, 2};
	int max;
	int i;

	/* TODO: Implement finding the maximum value in the vector */
	max = v[0];
	i = 1;
    int size = sizeof(v) / sizeof(int) - 1; //sunt 7 da incep de la 0;
    printf("size of the array %d\n", size);

check:
    if(i == size)
        goto gata;
    
    if(max <= v[i])
        goto update_max;

    if(max > v[i])
        goto iter;

update_max:
    max = v[i];

iter:
    i++;
    goto check;

gata:
    printf("maximul din array este %d\n", max);
    return;

}