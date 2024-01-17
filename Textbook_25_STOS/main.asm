ExitProcess PROTO

.data

	dst db 3 dup (?)

.code

main PROC

	xor rdx, rdx
	xor r8, r8
	xor r9, r9

	mov al, 'A'
	lea rdi, dst
	mov rcx, sizeof dst

	cld
	rep stosb

	mov dl, dst[0]
	mov r8b, dst[1]
	mov r9b, dst[2]
	
	Call ExitProcess

	main ENDP
	END