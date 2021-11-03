%include "../utils/printf32.asm"

section .text

extern printf
global main
main:
    ; input values (eax, edx): the 2 numbers to compute the gcd for
    mov eax, 49
    mov edx, 28

    push eax
    push edx
    mov ecx, eax
    mov ebx, edx

gcd:
    neg eax
    PRINTF32 `gcd %d\n\x0`, eax
    je L3

L1:
    neg eax
    push eax
    push edx
    pop eax
    pop edx

L2:
    sub eax,edx
    PRINTF32 `l2 %d\n\x0`, eax
    jg L2
    jne L1

L3:
    add eax,edx
    PRINTF32 `l3 %d\n\x0`, eax
    jne print
    inc eax

print:
    ;add esp, 8
    
    pop ebx ; 49 si 28 in ordinea asta in stack
    pop ecx

    ; TODO 1: solve the 'Segmentation fault!' error

    ; TODO 2: print the result in the form of: "gdc(eax, edx)=7" with PRINTF32 macro
    ; output value in eax

    PRINTF32 `gdc(%d, %d) = %d\n\x0`, ecx, ebx, eax

    xor eax, eax
    ret
