ExitProcess PROTO

.data

	var word 256

.code

main PROC

	mov rax, 64

	push rax
	mov rax, 25

	push var
	mov var, 75

	pop var
	pop r10

	Call ExitProcess

	main ENDP
	END