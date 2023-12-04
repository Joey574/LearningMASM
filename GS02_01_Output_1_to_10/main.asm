extern WriteLine: proc

.data

value db "0"

.code

main PROC

	push rbp
	mov rbp, rsp

	start:
	mov rax, offset value
	push rax
	call WriteLine
	inc value
	cmp value, "9"
	jle start

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END