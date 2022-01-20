#include <stdio.h>

int main(void)
{
	char cpuid_str[13];

	__asm__ (""
	/* TODO: Make cpuid call and copy string in cpuid_str.
	 * eax needs to be 0
	 * After cpuid call string is placed in (ebx, edx, ecx).
	 */

	"xor eax, eax\n"
	"cpuid\n"
	"mov eax, %0\n" // pun in eax adresa stringului 
	//si acum la adresa stringului ei pun restul de info de care am nevoie in
	//afisarea numelui, probalil instructiunea cpuid face ceva mai mult decat
	//vad eu si in acest mod am asa:
	//la adresa fix de inceput am eax, deci de acolo incep sa completez cu numele id ul cpu ului;
	"mov [eax], ebx\n"
	"mov [eax + 4], edx\n"
	"mov [eax + 8], ecx\n"
	
	"mov %0, eax\n"
	//output
	:
	//input
	: "r" (cpuid_str)
	//saved register by compiler
	: "eax", "ebx", "ecx", "edx"
	);

	cpuid_str[12] = '\0';

	printf("CPUID string: %s\n", cpuid_str);

	return 0;
}
