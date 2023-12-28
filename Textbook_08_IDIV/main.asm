ExitProcess PROTO

.data

.code

main PROC
	
	xor rax, rax
	xor rbx, rbx
	xor rdx, rdx

	mov rax, 100
	mov rbx, 3

	idiv rbx
	mov rax, -100
	cqo
	idiv rbx

	call ExitProcess

	main ENDP
	END