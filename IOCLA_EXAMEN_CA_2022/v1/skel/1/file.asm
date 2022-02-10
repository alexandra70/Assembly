%include "utils/printf32.asm"
extern printf

section .data
    arr1 dd -100, 200, 300, -400, -950, 230, 900, -230, -180, 100
    arr2 dd 300, 900, -200, -300, -50, -70, -800, -30, -280, 120
    N dd 10
    param_a dd 2
    param_b dd 3
    arr dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
    n dd 10
    int_format dd "%d ", 10, 0

    ;TODO c: definiti vectorul 'res' cu dimensiunea `N` elemente de tip double word (4 octeti)
section .bss
    res:    resd 10

section .text
    global main


;;https://github.com/lucigrigo/University/tree/master/2nd%20Year/IOCLA%20-%20Assembly%20Language/_examStuff/SUB
;;sub 2

print:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ecx, [ebp + 12] ;;n

    xor ebx, ebx
iter:
    mov esi, [eax + ebx * 4]

    pusha
    push esi
    push int_format
    call printf
    add esp,8
    popa

    inc ebx
    loop iter

        PRINTF32 `  \n\x0`

    leave
    ret

mul:
    push ebp
    mov ebp, esp

    push ecx
    push ebx

    mov ecx, [ebp + 8] ;; fisrts
    mov ebx, [ebp + 12] ;;second

    mov eax, 7
    mul ecx

    add eax, ebx

    pop ebx
    pop ecx

    leave
    ret

apply:
    push ebp
    mov ebp, esp

    mov edi, [ebp + 8] ;;*arr
    mov ecx, [ebp + 12] ;;n

    xor ebx, ebx

for:
    mov esi, [edi + ebx * 4]

    ;;apply
 
    push dword [ebp + 16]
    push esi
    call mul
    add esp, 8

    mov [edi + ebx * 4], eax

    inc ebx 
    loop for

    leave
    ret

main:
    push ebp
    mov ebp, esp

    ;;print arr
    push dword [n]
    push arr ;;pun aderesa lui arr
    call print
    add esp, 8

    ;;apply
    push dword [param_b]
    push dword [n]
    push arr
    call apply
    add esp, 12

   ;;print arr
    push dword [n]
    push arr ;;pun aderesa lui arr
    call print
    add esp, 8

    ;; int mul(int a, int b) = 7*a + b;
    ;; trebuie sa definesc param_a si param_b

    push dword [param_b]
    push dword [param_a]
    call mul
    add esp, 4
    PRINTF32 ` ---mul-%d------ \n\x0`, eax


    ; TODO a: afisati vectorul arr1

    mov ecx, [N]
    xor ebx, ebx
print_arr:
    mov eax, [arr1 + ebx * 4]
    PRINTF32 `%d\n\x0`, eax
    inc ebx
    loop print_arr

    PRINTF32 ` ---------- \n\x0`

    ; TODO b: afisati modulul fiecarui element din vectorul `arr2`
    ; modulul unui numar x, este definit astfel:
    ;   |x| =
    ;       * x, daca x >= 0
    ;       * -x, daca x < 0

    mov ecx, [N]
    xor ebx, ebx
print_modul:
    mov eax, [arr1 + ebx * 4]
    mov esi, eax
    cmp eax, 0
    jl schimb_semn
    jmp nu_schimb
schimb_semn:
    xor edi, edi
    sub edi, esi
    mov esi, edi 

nu_schimb:
    PRINTF32 `%d cu modulul - > %d\n\x0`, eax, esi
    inc ebx
    loop print_modul

    PRINTF32 ` ---------- \n\x0`

    ; TODO c: Determinati suma modulelor numerelor din vectorul arr1
    ; s = |arr1[0]| + |arr1[1]| + ... + |arr1[N-1]|

    mov ecx, [N]
    xor edi, edi
    xor ebx, ebx
add_modul:
    mov eax, [arr1 + ebx * 4]
    mov esi, eax
    cmp eax, 0
    jl change_sign
    jmp not_change
change_sign:
    push edi
    xor edi, edi
    sub edi, esi
    mov esi, edi 
    pop edi

not_change:
    PRINTF32 `%d cu modulul - > %d\n\x0`, eax, esi
    add edi, esi
    inc ebx
    loop add_modul

    PRINTF32 ` ----%d------ \n\x0`, edi

    ; TODO d: Completati vectorul `res` astfel incat fiecare element res sa fie modulul diferentei
    ; elementelor din vectorii `arr1` si `arr2`
    ; res[i] = |arr1[i] - arr2[i]|, 0 <= i < N

    ; TODO d: Afisati vectorul `res`

    mov ecx, [N]
    xor ebx, ebx
add_moduld:
    mov eax, [arr1 + ebx * 4]
    mov edi, [arr2 + ebx * 4]

    sub eax, edi

    cmp eax, 0
    jl change_signd
    jmp not_changed
change_signd:
    push edi
    xor edi, edi
    sub edi, eax
    mov eax, edi 
    pop edi


not_changed:
    mov [res + ebx * 4], eax
    PRINTF32 `in vector res %d\n\x0`, [res + ebx * 4]
    inc ebx
    loop add_moduld

    ; Return 0.
    xor eax, eax
    leave
    ret
