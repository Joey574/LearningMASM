ExitProcess PROTO

.data

var dq 2

.code

main PROC

	xor rdx, rdx

	mov rax, 10
	mov rbx, 5
	mul rbx
	mul var
	mov rbx, 8
	div rbx

	call ExitProcess

	main ENDP
	END