

section .data
    printf_fmt_int: db "%d", 10, 0
    alice:          db "Alice", 0
    bob:            db "bob", 0
    scanf_fmt:      db "%10s", 0
    
    string:         times 11 db 0
    chr_format:     db "%c       ", 0
    str_format:     db "%s", 0


section .text
    extern scanf
    extern strchr
    extern strlen
    extern printf
    extern puts
    global main

;;caut in alice i si x sa vad pe ce pcaos sunt

mystrchr:
    push ebp
    mov ebp, esp
    ; TODO a
    mov esi, [ebp + 8] ;;sprimesc stringul si chr
    mov edx, [ebp + 12] ;;aici am chr
    xor ebx, ebx
    xor ecx, ecx

    pusha 
    push edx
    push chr_format
    call printf
    add esp, 8
    popa

while:
    mov bl, byte [esi + ecx]
    test bl, bl
    jz negasit
    cmp bl, dl
    je gasit
    inc ecx
    jmp while

negasit:
    mov ecx, -1

gasit:
    mov eax, ecx

liv:

    leave
    ret

is_lower:
    push ebp
    mov ebp, esp

    ; TODO b
    mov esi, [ebp + 8] ;;stringul 

iter:
    mov bl, byte [esi + ecx]
    test bl, bl
    jz ok
    cmp bl, 'a'
    jl mare


    inc ecx
    jmp iter

mare:
    mov eax, -1
    jmp ex
ok:
    mov eax, 0

ex:

    leave
    ret

main:
    push ebp
    mov ebp, esp


    ; TODO a

    push byte 'i'
    push alice
    call mystrchr
    add esp, 9

    push eax
    push printf_fmt_int
    call printf
    add esp, 8

;----------------------

    push byte 'x'
    push alice
    call mystrchr
    add esp, 9

    push eax
    push printf_fmt_int
    call printf
    add esp, 8

    ; OUTPUT:
    ; 2
    ; -1

    ; TODO b

    push alice
    call is_lower
    add esp, 4

    push eax
    push printf_fmt_int
    call printf
    add esp, 8

    push bob
    call is_lower
    add esp, 4

    push eax
    push printf_fmt_int
    call printf
    add esp, 8
    
    ; OUTPUT:
    ; -1
    ; 0

    ; TODO c
    ;;din ce imi dau seama trebuie sa citesc cu scanf un string si sa vad dc e mare sau nu

    push string
    push str_format
    call scanf
    add esp, 8

    xor eax, eax
    leave
    ret