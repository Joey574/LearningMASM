ExitProcess PROTO

.data

	src db 'abc'

.code

main PROC

	xor rdx, rdx
	xor r8, r8
	xor r9, r9

	lea rsi, src
	mov rdi, rsi
	mov rcx, sizeof src

	cld
	start:
	lodsb
	sub al, 32
	stosb
	dec rcx
	jnz start

	mov dl, src[0]
	mov r8b, src[1]
	mov r9b, src[2]

	Call ExitProcess

	main ENDP
	END