extern strlen
extern printf


section .rodata
    test_str db "hell, it's about time", 0
    format db "length = %d", 10, 0

section .text
global main

my_strlen:
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]
    mov bl, byte [esi]
    test bl, bl
    jz gata

    inc esi
    inc eax

    push esi
    call my_strlen
    add esp, 4

gata:

    leave
    ret


main:
    push ebp
    mov ebp, esp



    push test_str
    call strlen
    add esp, 4


    push eax
    push format
    call printf
    add esp, 8

    xor eax, eax

    push test_str
    call my_strlen
    add esp, 4

    
    push eax
    push format
    call printf
    add esp, 8
    


    ; TODO a: Implement strlen-like functionality using a RECURSIVE implementation.


    ; Return 0.
    xor eax, eax
    leave
    ret
