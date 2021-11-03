%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    ;push ecx
    mov [esp], ecx
    PRINTF32 `%hd \n\x0`, ecx
    loop push_nums

    ;push 0
    ;push "mere"
    ;push "are "
    ;push "Ana "
    sub esp, 4
    mov dword [esp], 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are"
    sub esp, 4
    mov dword [esp], "Are"

xor ecx, ecx

thenr:
    lea eax, [esp + ecx]
    ;hhd short short(eventual unsigned)
    PRINTF32 `%x : %hhd \n\x0`, eax, [eax]
    inc ecx
    cmp ecx, 36
    jne thenr

    xor ecx, ecx

prin:
    lea esi, [esp + ecx*4]
    PRINTF32 `%s \x0`, esi
    inc ecx
    cmp ecx, 3
    jnz prin

    ;ana are mere -> 12
    ;add esp, 4

;ecx e 3 aici si a acoperit 3 octeti deja

 PRINTF32 `\n\x0` 
inc ecx
nrr:
    lea eax, [esp + ecx*4]
    PRINTF32 `%d \x0`, [eax]
    inc ecx
    cmp ecx, 9
    jne nrr

    xor ecx, ecx

   

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above

    ; TODO 3: print the string

    ; TODO 4: print the array on the stack, element by element.

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
