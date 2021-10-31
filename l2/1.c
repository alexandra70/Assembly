#include <stdio.h>

/**
 * Afisati adresele elementelor din vectorul "v" impreuna cu valorile
 * de la acestea.
 * Parcurgeti adresele, pe rand, din octet in octet,
 * din 2 in 2 octeti si apoi din 4 in 4.
 */

int main() {

    int v[] = {0xCAFEBABE, 0xDEADBEEF, 0x0B00B135, 0xBAADF00D, 0xDEADC0DE};
    unsigned char *char_ptr = &v;
    short* s_ptr = &v;
    int* int_ptr = &v; //toate pointeaza la adresa de inceput a lui v
    int n = sizeof(v) / sizeof(char);
    int m = sizeof(v) / sizeof(short); //se vrea a fi parcurs din 2 2 2
    int p = sizeof(v) / sizeof(int); // si din 
    
    for(int i = 0; i < n; i ++, char_ptr++) { 
        printf("%p -> 0x%x\n", char_ptr, *char_ptr);
    }

    printf("din 2 in 2\n");
    for(int i = 0; i < m; i ++, s_ptr++) { 
        printf("%p -> 0x%x\n", s_ptr, *s_ptr);
    }

    printf("int octeti\n");

    for(int i = 0; i < p; i ++, int_ptr++) { 
        printf("%p -> 0x%x\n", int_ptr, *int_ptr);
    }

    return 0;
}