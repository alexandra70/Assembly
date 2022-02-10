%include "utils/printf32.asm"
extern printf

section .data

    M dd 0x12121212 ;; 8 biti de 1
    mask db 0x12


    arr dd 0x12345678, 0x12121212, 0x42424242, 0x12771277, 0xCAFEBABE, 0x12001200, 0x20222022, 0x03020302, 0x12FF12FF, 0xFF12FF12
    len equ 10

    leni dd 10

;TODO c: Declarati vectorul de intregi (double word) `res` cu dimensiunea egala cu `len`

    res:  times 10  dd 0


section .text
global main

main:
    push ebp
    mov ebp, esp

    ; TODO a: Calculați și afișati numărul de biți `1` din numărul întreg `M`.
    ; Numărul `M` este definit în secțiunea `.data`.

    mov eax, [M] ;;iau nr de la adresa
    mov ebx, 1 ;;masca mea
    mov ecx, 32
    xor esi, esi

count:
    mov edx, eax
    and edx, ebx
    jnz aduna
    jmp dupa_add
aduna:
    inc esi
    jmp dupa_add
dupa_add:
    shl ebx, 1
    loop count

    PRINTF32 `%d\n\x0`, esi

    ; TODO b: Calculați și afișati numărul de octeți egali cu `mask` din numărul întreg `M`.
    ; Numerele `M` și `mask` sunt definite în secțiunea `data`
    mov eax, [M] ;;iau nr de la adresa
    mov ebx, [mask] ;;masca mea
    mov ecx, 0 ;;
    xor esi, esi

oct:
    mov edx, [M] ;;nr meu
    and edx, ebx
    ;;am in edx numaul meu

    cmp ebx, edx
    je inc_esi
    jmp dupa_inc_esi
inc_esi:
    inc esi
dupa_inc_esi:
    
    inc ecx
    cmp ecx, 4
    je gata_oct
    shl ebx, 8 ;;trec la urm octet
    jmp oct

gata_oct:
    PRINTF32 `%d\n\x0`, esi

    ; TODO c: Completați vectorul `res` de dimensiune `len` astfel:
    ;   - fiecare element res[i] este egal cu numărul de octeți din arr[i] ce au valoarea `mask`

    xor ebx, ebx

funcc:
    mov eax, [arr + ebx * 4]

    mov edi, [mask] ;;masca mea
    mov ecx, 0
    xor esi, esi

inner_oct:
    mov edx, eax
    and edx, edi
  
    cmp edi, edx
    je inner_inc_esi
    jmp inner_dupa_inc_esi
inner_inc_esi:
    inc esi
inner_dupa_inc_esi:
    
    inc ecx
    cmp ecx, 4
    je inner_gata_oct
    shl edi, 8 ;;trec la urm octet
    jmp inner_oct

inner_gata_oct:


    mov [res + ebx * 4], esi
    mov eax, [res + ebx * 4]
    PRINTF32 `din res - > %d\n\x0`, eax
    inc ebx
    cmp ebx, 10
    jge gata_func
    jmp funcc
gata_func:

    ; TODO d: Afișați vectorul `res` de dimensiunea `len` completat cu elementele definite la punctul c)
    ;; rezolvarea e la tagul afisare.

    mov ecx, len
    xor ebx, ebx

    PRINTF32 `ecx - > %d\n\x0`, ecx

printi:

    mov eax, [res + ebx * 4]
    PRINTF32 `din res - > %d\n\x0`, eax

    inc ebx
    loop printi

    ; Return 0.
    xor eax, eax
    leave
    ret
