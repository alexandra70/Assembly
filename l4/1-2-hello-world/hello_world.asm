%include "../io.mac"

section .data
    myString: db "Hello, World!", 0
    myGBString: db "Goodbye, World!", 0

section .text
    global main
    extern printf

main:
    mov ecx, 6                      ; N = valoarea registrului ecx
    mov eax, 4
    mov ebx, 1
    cmp eax, ebx
    jg print                        ; TODO1: eax > ebx?
    ret


    add ecx, 1
print:
    PRINTF32 `%s\n\x0`, myString
    sub ecx, 1
    cmp ecx, ebx
    jge print
                                    ; TODO2.2: afisati "Hello, World!" de N ori
                                    ; TODO2.1: afisati "Goodbye, World!"

    PRINTF32 `%s\n\x0`, myGBString                                    

    ret
