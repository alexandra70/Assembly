%include "../utils/printf32.asm"

section .text

extern printf
global main
main:
    ; numbers are placed in these two registers
    mov eax, 1
    mov ebx, 4 

verific:
    cmp eax, ebx
    jg gata 

schimb:
    push eax
    push ebx
    pop eax
    pop ebx

gata:
    ; TODO: get maximum value. You are only allowed to use one conditional jump and push/pop instructions.

    PRINTF32 `Max value is: %d\n\x0`, eax ; print maximum value

    ret
