ExitProcess PROTO

.data

	src db 'abc'
	found byte ?

.code

main PROC

	xor rax, rax

	mov al, 'b'
	lea rdi, src
	mov rcx, sizeof src

	cld
	repne scasb
	jnz absent
	mov found, 1
	jmp finish

	absent:
	mov found, 0
	finish:

	Call ExitProcess

	main ENDP
	END