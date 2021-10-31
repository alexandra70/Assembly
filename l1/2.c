#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int my_strlen(const char *str)
{
	
    char* dup = (char*)str;
    int i;
    for(i = 0; *(dup + i) != '\0'; i++) {
    }

    return i;
}

void equality_check(const char *str)
{
	char* dup = (char*)str;

    int leng = my_strlen(dup); //llen of the str;

    int i;
    for(i = 0; i < leng; i++) {
        if( dup[i] ^ dup[(i + (1<<i)) % leng]) {
            //printf("adress of(char) %c : %p\n", dup[i], &(dup[i]));
            printf("adress of(char) %c : %p\n", *(dup + i), (dup + i));
        }
        
    }
}

int main(void)
{

    char *str = "abcabc";
    printf("%d --(len)-- \n", my_strlen(str));

    equality_check(str);

	
	return 0;
}