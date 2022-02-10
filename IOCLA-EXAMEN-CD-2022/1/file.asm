%include "utils/printf32.asm"
extern printf

section .data

M dw 1000
N dw 700

arr1 dw 1000, 1000, 30, 40, 50, 60, 70, 80, 90, 100
arr2 dw 90, 100, 90, 50, 40, 30, 20, 10, 60, 100
len equ 10

res: times 10 dd 0

section .bss

; TODO c: Alocati memorie pentru vectorul `res` cu elemente de tip double word si dimensiunea egala cu `len`

section .text

global main

main:
    push ebp
    mov ebp, esp

    ; TODO a: Calculati si afisati produsul numerelor reprezentate pe 2 octeti (word) M si N.
    ; Sugestie: Pentru inmultire puteti folosi instructiunea `mul` care:
    ;   - primeste primul operand in registrul AX
    ;   - primeste al doilea operand intr-un registru pe 16 biti / memorie de 16 biti
    ;   - intoarce rezultatul in DX:AX
    ;   - pe scurt, DX : AX = AX * r/m16.

    xor eax, eax
    xor edx, edx
    xor ebx, ebx
    mov ax, [M]
    mov bx, [N]
    mul bx
    PRINTF32 `punctul a : %hx%hx\n\x0`, edx, eax

    ; TODO b: Calculati si afisati produsul scalar al vectorilor arr1 si arr2
    ;   - P = arr1[0] * arr2[0] + arr1[1] * arr2[1] + ... arr1[i] * arr2[i] + ...
    ;   - este garantat ca P nu depaseste dimensiunea unui double word (4 octeti)

    mov ecx, len
    xor ebx, ebx
    xor esi, esi
for:
    xor edx, edx ;; 
    xor eax, eax

    mov ax, [arr1 + ebx * 2]
    mov bx, [arr2 + ebx * 2]
    mul bx

    add esi, eax

    inc ebx
    
    loop for

gata_for:

    PRINTF32 `pct b : %d\n\x0`, esi

    ; TODO c: Completati vectorul `res` cu elemente de tip double word de dimensiune `len`  astfel incat
    ; fiecare element sa fie egal cu produsul elementelor corespunzatoare din vectorii `arr1` si `arr2`.
    ; - e.g: res[i] = arr1[i] * arr2[i]

    mov ecx, len
    xor ebx, ebx
    xor esi, esi
for_res:
    xor edx, edx ;; 
    xor eax, eax

    mov ax, [arr1 + ebx * 2]
    push ecx
    mov cx, [arr2 + ebx * 2]
    mul cx ;;
    pop ecx

  
    mov word [res + ebx * 4], ax
    mov word [res + ebx * 4 + 2], dx

    inc ebx
    loop for_res

    ; TODO d: Afisati vectorul `res` cu elemente de tip double word de dimensiune `len` calculat la punctul c)

    mov ecx, len
    xor ebx, ebx
    xor esi, esi

print:
    xor eax, eax
    mov eax, [res + ebx * 4]
    PRINTF32 `in hex nr - > %d\n\x0`, eax
    inc ebx
    loop print

    ; Return 0.
    xor eax, eax
    leave
    ret
