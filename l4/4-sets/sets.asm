%include "../io.mac"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 ;10001011
    mov ebx, 169 ;10101001
    mov ecx, eax ;pun aici raspunsul;
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    xor edx, edx
    mov edx, eax
    or edx, ebx 
    PRINTF32 `reuniunea a doua multimi %u\n\x0`, edx
    
    ; TODO2: adaugarea unui element in multime
    mov edx, 4 ;139 nu il are pe 4 de exemplu ++ adaug 4
    or ecx, edx
    mov edx, 16
    or ecx, edx
    PRINTF32 `adaug 4 + 16 in multimea eax %u\n\x0`, ecx
    xor edx, edx

    ; TODO3: intersectia a doua multimi
    xor edx, edx
    mov edx, eax
    and edx, ebx  
    PRINTF32 `intersectie a doua multimi %u\n\x0`, edx

    ; TODO4: complementul unei multimi
    mov edx, eax
    not edx
    shl edx, 24
    shr edx, 24
    PRINTF32 `complementul pe 8 biti %u\n\x0`, edx

    ; TODO5: eliminarea unui element
    mov edx, eax
    mov ecx, 4
    or edx, ecx ;adaug 4
    shl ecx, 24
    not ecx ; fac tot din ecx 1 in afara de ce e setat 
    shr ecx, 24
    and edx, ecx ; 
    PRINTF32 `elminare element %u\n\x0`, edx

    ; TODO6: diferenta de multimi EAX-EBX
    mov edx, eax
    mov ecx, ebx
    not ebx
    and edx, ebx ; a and (not b)
    PRINTF32 `diferenta sets %u\n\x0`, edx

    xor eax, eax
    ret
