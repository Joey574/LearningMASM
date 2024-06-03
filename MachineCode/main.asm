.data

.code

main PROC

	push rbp
	mov rbp, rsp

	lea rcx, MyLabel
	nop
	nop
	nop

	MyLabel:
	inc rax
	nop
	inc rcx
	nop
	inc rdx
	nop
	inc rbx
	nop
	inc rsp
	nop
	inc rbp
	nop
	inc rsi
	nop
	inc rdi
	nop
	nop
	inc r8
	nop
	inc r9
	nop
	inc r10
	nop
	inc r11
	nop
	inc r12
	nop
	inc r13
	nop
	inc r14
	nop
	inc r15

	nop
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END