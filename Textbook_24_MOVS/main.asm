ExitProcess PROTO

.data

	src byte 'abc'
	dst byte 3 dup (?)

.code

main PROC

	xor rdx, rdx
	xor r8, r8
	xor r9, r9

	lea rsi, src
	lea rdi, dst
	mov rcx, sizeof src

	cld
	rep movsb

	mov dl, dst[0]
	mov r8b, dst[1]
	mov r9b, dst[2]

	Call ExitProcess

	main ENDP
	END