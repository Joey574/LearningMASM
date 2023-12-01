extern WriteLine: proc

.data

.code

main PROC

	push rbp
	mov rbp, rsp

	xor rax, rax
	mov al, "0"

	start:
	push rax
	call WriteLine
	pop rax
	inc rax
	cmp rax, "9"
	jle start

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END