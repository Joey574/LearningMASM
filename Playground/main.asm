extern WriteLine: proc

.data

.code

stringOne db 64 dup (?)
stringTwo db "testing write function"

main PROC
	
	push rbp
	mov rbp, rsp

	mov stringOne, "testing write function"

	;mov rax, "etirw gnitset"
	push rax
	
	call WriteLine

	mov rsp, rbp
	pop rbp

	ret

	main ENDP
	END