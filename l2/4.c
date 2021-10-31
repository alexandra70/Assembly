#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
	Functie generica pentru calcularea valorii maxime dintr-un array.
	n este dimensiunea array-ului
	element_size este dimensiunea unui element din array
	Se va parcurge vectorul arr, iar la fiecare iteratie sa va verifica
	daca functia compare intoarce 1, caz in care elementul curent va fi
	si cel maxim. 
	Pentru a folosi corect aritmetica pe pointeri vom inmulti indexul curent
	din parcurgere cu dimensiunea unui element.
	Astfel, pentru accesarea elementului curent avem:
	void *cur_element = (char *)arr + index * element_size;
*/

void *find_max(void *arr, int n, int element_size, 
				int (*compare)(const void *, const void *)) {
	//qsort(arr, n, element_size, compare);

    void* maxi = arr; //e un pointerr care pointeaza unde zice arr
    //deci cand ii dau efectiv * imi ia primul element din array;
    printf("ce e aici - >%d<-\n", *(int*)maxi);
    for(int index = 0; index < n; index ++) {
        if(compare (maxi, arr + index * element_size)) {
            maxi = arr + index * element_size;
        }
    }

    //return arr;
    return maxi;
}

/*
	a si b sunt doi pointeri la void, dar se specifica in enunt
	ca datele de la acele adrese sunt de tip int, asadar trebuie
	castati.
	Functia returneaza 1 daca valorea de la adresa lui a este mai
	mare decat cea de la adresa lui b, in caz contrar returneaza 0.
*/

int compare(const void *a, const void *b) {
    if( *((int*)a) < *((int *)b)) {
        return 1;
    } 
    return 0;
}

/*
	Se citeste de la tastatura un vector si se cere sa se afle
	elementul maxim folosind functia find_max.
	Rezultatul functiei find_max trebuie cast la int, spre exemplu:
	int *res = (*int) find_max(...);
*/
int main() {
	int n;
	scanf("%d", &n);

	int *arr = malloc(n * sizeof(*arr));

	for (int i = 0 ; i < n; ++i)
		scanf("%d", &arr[i]);       

	int *max = (int*)find_max(arr, n, sizeof(*arr), compare);
	printf("%d\n", *max);

	free(arr);
	return 0;
}