section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "--{AbcdefghijZ}--", 0
    after2_format db "rotate: %s", 13, 10, 0
    rot db "abcszzAB", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    ; TODO

    xor edx, edx

trans:
    mov eax, [ebp + 8] ;aici ar trebui sa fie stringul
    mov bl, byte [eax + edx] ;ia primul byte de la adresa pe care o indic intre []
    ;vad dc am ajuns la sfarsit
    cmp bl, 0 ;or test bl, bl (je test zf)
    je gata
    
    ;vad daca sunt pe o litera mica adica in intervalul 61 - 92
    cmp bl, 0x61
    jl increment
    cmp bl, 0x7A
    jg increment
   
    sub bl, 0x20
    ;mov bl, 0x61
    mov byte[eax + edx], bl

increment:
    inc edx
    jmp trans

gata:
    leave
    ret


rot13:
    push ebp
    mov ebp, esp

    mov eax, [esp + 8]
    xor edx, edx
   
caract:

    mov bl, byte [eax + edx]

    test bl, bl
    je gata_rot

    cmp bl, 0x41
    jl incr

    cmp bl, 0x5A
    jg interval

    cmp bl, 0x4E
    jg substract

    add bl, 0xd
    jmp incr

interval:

    cmp bl, 0x61
    jl incr
    cmp bl, 0x7A
    jg incr

    cmp bl, 0x6E
    jg substract

    add bl, 0xd
    jmp incr

substract:
    sub bl, 0xd
    jmp incr

incr:
    mov byte [eax + edx], bl
    inc edx
    jmp caract

gata_rot:
    leave
    ret

main:
    push ebp
    mov ebp, esp
    xor eax, eax

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    push rot
    call rot13
    add esp, 4

    push rot
    push after2_format
    call printf
    add esp, 8

    leave
    ret
