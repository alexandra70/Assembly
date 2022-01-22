global runAssemblyCode

extern printf

section .data
    str: db "%d",10,13

section .text
runAssemblyCode:
    push ebp
    mov ebp, esp

    ; save registers
    push ebx
    push ecx
    push edx

    ; N
    mov ecx, [ebp+12]

    ; sum
    mov eax, 0

    ; int* a
    mov edx, [ebp+8]

    jmp L1

L2:
    dec ecx
    lea ebx, [edx + 4*ecx]
    add eax, [ebx]

L1:
    ; if i < N
    cmp ecx, 0
    jne L2

    ; recover registers
    pop edx
    pop ecx
    pop ebx

    pop ebp
    ret
