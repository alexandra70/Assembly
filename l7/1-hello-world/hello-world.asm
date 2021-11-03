%include "../utils/printf32.asm"

section .data
    msg db 'Hello, world!', 0

section .text

extern puts
global main
main:
    push ebp
    mov ebp, esp

    push msg ;pun argument pe stiva si apelez functia;
    call puts
    add esp, 4

    leave
    ret
