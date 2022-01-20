section .text

global get_max

get_max:
	push rbp
	mov rbp, rsp


;pe x86 primii trei param se pun in ordine pe stiva, astfel:
; rdi ; rsi ; rdx

	mov rbx, rdi	;array
	mov rcx, rsi
	xor rax, rax
	xor edx, edx

compare:
	cmp edx, [rbx + rcx * 4 - 4]
	jge check_end
	mov edx, [rbx + rcx * 4 - 4]
	mov rax, [rbx + rcx * 4 - 4]
	dec rcx
check_end:
	loopnz compare

	leave
	ret
