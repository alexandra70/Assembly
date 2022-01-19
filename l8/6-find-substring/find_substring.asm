%include "../utils/printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

print_format: db "Substring found at index: ", 0
string_format db "%s"
vect: times 10 db 0

section .text
extern printf
global main

find:
    push ebp
    mov ebp, esp

    ;aici am adresa vector
    mov eax, [ebp + 20]
    PRINTF32 `%d\n\x0`, eax  ;aici incer ca modific vect[0]
    PRINTF32 `veriifcare registru %d\n\x0`, [eax]

    ;aici am indexul la care trebuie sa adaug valoare in vect
    mov ebx, [ebp + 16]
    PRINTF32 `ce vaoare are pos - - - - - %d\n\x0`, ebx 
    mov esi, [ebp + 12]
    PRINTF32 `%s\n\x0`, esi 
    mov edi, [ebp + 8]
    PRINTF32 `%s\n\x0`, edi 

    xor ecx, ecx
    xor edx, edx

func:

    mov bl, byte [esi + ecx]
    test bl, bl ;   if is null then we stop;
    je stop
    mov al, byte [edi + edx]
    cmp bl, al
    je incr_both
    jmp incr_ecx

incr_ecx:

    xor edx, edx;   reset edx
    inc ecx
    jmp func
    
incr_both:
    ;vad dc sunt la sfarsitul sirului pe care il caut, dc da ma opresc pt ca am gasit
    inc edx
    mov al, byte[edi + edx]
    test al, al
    je found
    ;altfel nu sunt la final inca
    inc ecx
    jmp func

found:
    ;diferent dintre pos ecx din stringu mare minus cat e singul cautat;
    inc ecx ;la cum am facut eu incrementez edx, dar nu si pe ecx, deci o sa fie o diferenta acolo de 1 si adaug aici(altfel as f cu o pos in urama)
   
    lea eax, [esi + ecx] ; pun in eax restul sirului
    sub ecx, edx ; ata e pos

    mov edx, [ebp + 20]
    mov ebx, [ebp + 16]
    PRINTF32 `pun aici ebx : %d\n\x0`, ebx 
    cmp ebx, 0
    jne more_moves
    mov dword [edx + ebx*4], ecx

after:
    leave
    ret

more_moves:
    
    mov dword [edx + ebx * 4], ecx
    mov ebx, [esp + 16]
    dec ebx
    mov ecx,  [edx + ebx * 4]
    inc ebx
    add ecx, 4 ; cat e deplasamentul (eu sar peste 4 bytes)
    add [edx + ebx * 4], ecx
    jmp after

stop:
    mov eax, esi ;sirul ramane acelasi
    leave
    ret

main:
    push ebp
    mov ebp, esp

    xor eax, eax
    mov esi, source_text
    PRINTF32 `%s\n\x0`, esi 
    mov edi, substring
    PRINTF32 `%s\n\x0`, edi 

    xor ecx, ecx

verif:
    mov bl, byte [esi]
    test bl, bl
    je gata

    push ecx
    ;aici apelez functia
    push vect
    mov edx, ecx
    push edx ;indexul unde completez in vector 
    PRINTF32 `ce pun pe stiva %d\n\x0`, edx

    push esi
    push edi
    call find
    add esp, 16

    cmp esi, eax ;cand nu mai gaseste nimic sirurile raman la fel, deci nu e nevoie sa continuam;
    je gata

    mov esi, eax
    PRINTF32 `dupa apel 2 : %s\n\x0`, esi
    PRINTF32 `%s\n\x0`, edi

    pop ecx
    inc ecx
    PRINTF32 `ce pun pe stiva SI ACUM CUM INCREMETNEZ %d\n\x0`, ecx
    jmp verif
    ; TODO: Print the start indices for all occurrences of the substring in source_text

print_vector:
    mov eax, [vect + ecx * 4]
    cmp eax, 0
    je final
    PRINTF32 ` %d\x0 `, eax
    inc ecx
    jmp print_vector

gata:
    xor ecx, ecx

    push print_format
    push string_format
    call printf
    add esp, 8
    PRINTF32 ` \n\x0 `, 0
    jmp print_vector

final:
    PRINTF32 ` \n\x0 `, 0
    leave
    ret
