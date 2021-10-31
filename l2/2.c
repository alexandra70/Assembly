#include <stdio.h>
#include <string.h>
#include <stdlib.h>

char* delete_first(char *s, char *pattern) {
	
    char* p = s;
    int fin = 0;
    int k;
    //iterez char cu caracter pana la \0
    for(; *p != '\0'; p++) { //*p e efectv unde pointeaza adica primul char din string -> p[0]
        printf("%s     %d\n", p, *p);
        if (fin == 1) {
            break;
        }
        for(char* iter = pattern, k = 0; *iter != '\0'; iter ++, k ++) {

            if(*iter != *(p + k)) {
                break;
            }
            else {
                if(*(iter + 1) == '\0') {
                    //am ajun la finalul stringului si a verificat patternul, deci actualizaez si ies
                    for(; *(p + k) != '\0'; p++) {
                        *(p) = *(p + k + 1);
                    }
                    fin = 1;
                }
            }
            printf("k e egal cu -> %d\n", k);
            printf("%d     %d\n", *iter, *(p + k));
        }
    }


	return s;
}

int main(){
	char *s = strdup("Ana are mere");
	char *pattern = "re";

	// Decomentati linia dupa ce ati implementat functia delete_first.
	printf("%s\n", delete_first(s, pattern));
	free(s);

	return 0;
}