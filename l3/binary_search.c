#include <stdio.h>

void main(void)
{
	int v[] =  {1, 2, 15, 51, 53, 66, 202, 7000};
	int dest = v[2]; /* 15 */
    int x = dest;
	int start = 0;
	int end = sizeof(v) / sizeof(int) - 1;
    int mid;
	/* TODO: Implement binary search */

check:

    mid = (start + end) /2;
    if (*(v + mid) == dest)
        goto gata;

    if(v[mid] > x) //caut x in stanga 
        goto forleft;
    if(v[mid] < x)
        goto forright;

gata:
    printf("am gasit elem pe pos %d\n", mid);
    return;

forleft:
    end = mid - 1;
    goto check;

forright:
    start = mid + 1;
    goto check;

}
