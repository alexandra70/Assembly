%include "../utils/printf32.asm"

section .data
    mystring db "This is my string", 0
    sec db "String length is %u", 10, 0
    store_string times 64 db 0

section .text

extern puts
extern printf
global main
reverse_string:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp+8]
    mov ecx, dword [ebp+12]
    add eax, ecx
    dec eax
    mov edx, dword [ebp+16]

    ;deplasamentul cu eax, deci fix la ultimul caracter din primele ecx
    ;deci e iau pe rand si le adaug in edx care e golit
    ;incrementez unde pointeaza edx si continue pana cand ecx e gata
    ;adica pana am transferat toate elementel de inversat din string;

copy_one_byte:

    mov bl, byte [eax] ;in eax am pus src
    mov byte [edx], bl ;copiez din eax in ebx
    dec eax ; eax pointeaza la inceput la eax + 

    inc edx
    loopnz copy_one_byte

    inc edx
    mov byte [edx], 0

    leave
    ret

main:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, byte [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte

out:


    PRINTF32 `[PRINTF32]: %d\n[printf]: \x0`, ecx

    push ecx
    push sec
    call printf
    add esp, 4; acum sunt la string

    pop ecx ;acum esp e la ecx deci ii dau pop;
    PRINTF32 `[PRINTF32]: %d\n\x0`, ecx

    push store_string
    push ecx
    push mystring
    call reverse_string
    add esp, 12

    PRINTF32 `[reverse]: %s\x0`, store_string

    leave
    ret
