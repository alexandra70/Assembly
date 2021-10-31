#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

int my_strcmp(const char *s1, const char *s2) {
    //cat timp nu am ajuns la final si ele - cele 2 str sunt identice iterez prin ambele
    //cand devin inegale se iee si se verifica sa se vada care este cel mai mare sau in caz ca sunt la sf terminator de ir inseamna ca ambele unt gata;
    while(*s1 != '\0' && *s2 != '\0') {
        if(*s1 == *s2) {
            s1 ++;
            s2 ++;
        }
        else {
            break;
        }
    }
    printf("%s %s\n", s1, s2);
   if(*s1 == '\0' && *s2 == '\0') {
            return 0;
        }
    //if(*s1 > *s2) 
    //    return *s1 - *s2;
    //else 

    return *s1 - *s2;
}

void *my_memcpy(void *dest, const void *src, size_t n) {

    for(int i = 0; i < n; i ++) {
        *((char*)dest + i) = *((char*)src + i);
    }
    return dest;
}

char *my_strcpy(char *dest, const char *src) {

    int i;
    for( i = 0; *src != '\0'; i ++) {
        *((char*)dest + i) = *(char*)src;
        src ++;
    }
    *((char*)dest + i) = '\0';
    return dest;

}

int main() {
	char s1[] = "Abracadabra";
	char s2[] = "Abracababra";
	char src[] = "Learn IOCLA, you must!";
	char *dest = malloc(sizeof(src));

	/*
	Decomentati pe rand cate un assert pe masura ce implementati o functie.
	Daca functia voastra este implementata corect atunci asertia se va realiza
	cu succes. In caz contrar, programul va crapa.
	*/
	 assert(my_strcmp(s1, s2) == strcmp(s1, s2));
     printf("%d\n", my_strcmp(s1, s2));
     printf("%d\n", strcmp(s1, s2));
	 assert(my_memcpy(dest, src, sizeof(src)) == memcpy(dest, src, sizeof(src)));
	 assert(my_strcpy(dest, src) == strcpy(dest, src));
	free(dest);

	return 0;
}