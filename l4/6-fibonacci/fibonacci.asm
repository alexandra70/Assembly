%include "../io.mac"

section .text
    global main
    extern printf

main:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    sub eax, 2 ;am deja 2 puse fib 0 si de 1
    mov ebx, 0
    mov edx, 1
    mov ecx, 0

fib:
    cmp eax, 0
    jl gata

iter:
    sub eax, 1
    xor ecx, ecx
    add ecx, ebx
    add ecx, edx
   
    mov ebx, edx
    mov edx, ecx

    jmp fib

gata:
     PRINTF32 `fib %d\n\x0`, ecx
    ret
