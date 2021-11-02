%include "../io.mac"

section .data
    wrong: db 'Not today, son.',0
    right: db 'Well done!',0

section .text
    global main
    extern printf

main:
    mov eax, 1         ; TODO3.1: modify eax register
    mov ebx, 4        ; TODO3.1: modify ebx register
    mov ecx, 0x5                ; hardcoded; DO NOT change
    cmp eax, ebx
    jns bad
    cmp ecx, ebx
    jb bad
    add eax, ebx
    xor eax, ecx ;la fel 0, diferite 1 => (eax trebuie sa fie la fel ca ecx)
    jnz bad

good:
    PRINTF32 `%s\n\x0`, right
    ret
bad:
    PRINTF32 `%s\n\x0`, wrong
    ret
