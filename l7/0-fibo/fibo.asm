%include "../utils/printf32.asm"

%define NUM_FIBO 10

section .text

extern printf
global main

main:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    sub esp, NUM_FIBO * 4

    mov ecx, NUM_FIBO
    PRINTF32 `%d \n\x0`, ecx
    push 1
    push 1
    mov eax, 1
    mov ebx, 1
    add eax, ebx

sub ecx, 2

fibo:
    push eax ;imiping pe stiva de fiecare data valoarea eax
    mov edx, eax ;salvez al doilea nr
    add eax, ebx ;increment pe al doilea
    mov ebx, edx ; acum primul va fi al doilea nr
    loop fibo
   
mov ecx, NUM_FIBO

print:
;prima data il primtez pe ultimul pe care l-am pus in stiva; (adica primul inserat)
;e la cea mai mica - adresa asa creste stiva de la adrese mare la cele mici;
    mov eax, dword [esp + (ecx - 1) * 4] 
    PRINTF32 `%d \x0`, eax
    dec ecx
    cmp ecx, 0
    ja print

    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret
