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

void mirror(char *s)
{

    int leng = my_strlen(s);
    printf("len%d\n", leng);
    unsigned char c;
    for(int i = 0; i < leng/2; i++) {
        printf("seg  s[i] %c s[leng - i - 2] %c \n", s[i], s[leng - i - 1]);
        c = *(s + i);
        *(s + i) = *(s + (leng - i - 1));
        *(s + (leng - i - 1)) = c;
    }
	
    return;

}

int main()
{
	/* TODO: Test function */
	char *s = "abcde";
    mirror(s);
    printf("str-mir %s\n", s);

	return 0;
}