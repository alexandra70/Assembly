extern malloc
extern printf

section .data
    printf_fmt_int:         db "%d ", 0
    printf_fmt_newline:     db 10, 0
    printf_fmt_int_newline: db "%d", 10, 0
    n:                      dd 5
    arr:                    dd 11, 22, 33, 44, 55
    newvector               dd 0
    lungime                 dd 0
    arr1:   dd 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    res: times 11 dd 0

section .text
global main

;; Functie ce printeaza un vector void print_arr (char *p, int n) 
print_arr:
    push ebp
    mov ebp, esp
  
    ; TODO a
    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    xor ebx, ebx
iter:
    mov esi, [eax + 4 * ebx]
    
    pusha
    push esi
    push printf_fmt_int
    call printf
    add esp, 8
    popa 

    inc ebx
    loop iter

    leave
    ret

;;int(k) = k * 9 + 10 
compute:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ebx, 9
    mul ebx
    add eax, 10

    ; TODO b

    leave
    ret

new_array:
    push ebp
    mov ebp, esp
            
    mov edi, [ebp + 8] ;; arr1
    mov ecx, [ebp + 12] ;;len
    xor ebx, ebx

iter2:
    mov esi, [edi + 4 * ebx]
    
    push ebx
    push esi
    call compute
    add esp, 4
    pop ebx

    mov [edi + 4 * ebx], eax
    inc ebx
    loop iter2

    ; TODO c

    leave
    ret

main:
    push ebp
    mov ebp, esp

    ; TODO a
    ; call print_arr
    push dword [n]
    push arr
    call print_arr
    add esp, 8

    ; OUTPUT:
    ; 11 22 33 44 55

    ; TODO b

    push printf_fmt_newline
    call printf
    add esp, 4

    push dword 100
    call compute
    add esp, 4

    pusha
    push eax
    push printf_fmt_int
    call printf
    add esp, 8
    popa 

    ; OUTPUT:
    ; 55
    ; 910

    ; TODO c
    ; call new_array(11)

    push dword 11
    push arr1
    call new_array
    add esp, 8

    ; OUTPUT:
    ; 10 19 28 37 46 55 64 73 82 91 100

    push printf_fmt_newline
    call printf
    add esp, 4

    push dword 11
    push arr1
    call print_arr
    add esp, 8

    xor eax, eax
    leave
    ret
