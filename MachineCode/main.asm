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
	Mov al, 0FFh
	nop
	Mov cl, 0FFh
	nop
	Mov dl, 0FFh
	nop
	Mov bl, 0FFh
	nop
	mov spl, 0FFh
	nop
	mov bpl, 0FFh
	nop
	mov sil, 0FFh
	nop
	mov dil, 0FFh
	nop
	nop
	Mov r8w, 0FFh
	nop
	Mov r9w, 0FFh
	nop
	Mov r10w, 0FFh
	nop
	Mov r11w, 0FFh
	nop
	mov r12w, 0FFh
	nop
	mov r13w, 0FFh
	nop
	mov r14w, 0FFh
	nop
	mov r15w, 0FFh

	nop
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END