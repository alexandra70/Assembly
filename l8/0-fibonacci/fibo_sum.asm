%include "../utils/printf32.asm"

section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    print_format_1 db "Sum first %d", 10, 0
    print_format_2 db "fibo is %d", 10, 0
    ajust db "ecx %d", 10, 0
    
section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    push dword [N]
    push print_format_1
    call printf
    add esp, 8
    
    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    xor eax, eax     ;store the sum in eax
    
    ; use loop instruction 

    mov ecx, [N]
    mov eax, 1
    mov ebx, 1
    xor edx, edx
    sub ecx, 2

fibo:
    mov edx, eax
    add eax, ebx
    mov ebx, edx

    add edx, eax
    push edx

    loop fibo 

    pop eax

mov ecx, [N]
sub ecx, 4


    push eax
    push print_format_2
    call printf
    add esp, 8

eliberez:
    pop ecx
    loop eliberez

    
    xor eax, eax
    leave
    ret