ExitProcess PROTO

.data

	src db 'abc'
	dst db 'abc'
	match db ?

.code

main PROC

	lea rsi, src
	lea rdi, dst
	mov rcx, sizeof src

	cld
	repe cmpsb

	jnz differ
	mov match, 1
	jmp finish
	differ:
	mov match, 0
	finish:

	Call ExitProcess

	main ENDP
	END