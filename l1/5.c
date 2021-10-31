#include <stdio.h>
#include <stdlib.h>

void hexa(int number) {
    printf("0x%08x\n", number);
}

void print_binary(int number, int nr_bits)
{
	int i;
    printf("0b");
    //aici nu imi ia -da eu ma opresc la > 0 si asta inseamana ca eu
    //nu iau 1 << 0 care e destul de impotrant in nr - e 1 e primul bit de la coada
    for(int j = 7; j > -1; j--) {
        i = 0;
        i = 1 << j;
        if(number & i) //e 1
            printf("1");
        else
            printf("0");
   
    }
	
	printf("\n");
}

void check_parity(int *number, int n)
{
	for(int i = 0; i < n; i ++) {
        if (*(number + i) & (1 << 0)) { //verific dc are ultimul bit setat sau nu
            //printf("%d e impar HEXA \n", *(number + i));
            hexa(*(number + i));
        }
        else {
            //printf("%d e par BINARY \n", *(number + i));
            print_binary(*(number + i), n);
        }
    }
}

int main()
{
	int numbers[5] = {214, 71, 84, 134, 86};
	check_parity(numbers, 5);
	return 0;
}