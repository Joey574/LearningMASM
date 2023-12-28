ExitProcess PROTO

.data

	var dq 4

.code

main PROC

	xor rax, rax
	xor rbx, rbx

	mov rax, 10
	mov rbx, 2
	
	imul rbx
	imul rax, var
	imul rax, rbx, -3

	call ExitProcess

	main ENDP
	END