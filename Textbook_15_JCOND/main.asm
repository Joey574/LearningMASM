ExitProcess PROTO

.data

.code

main PROC
	
	xor rdx, rdx
	mov cl, 255
	add cl, 1
	jc carry
	mov rdx, 1
	carry:

	mov cl, -128
	sub cl, 1
	jo overflow
	mov rdx, 2
	overflow:

	mov cl, 255
	and cl, 10000000b
	js sign
	mov rdx, 3
	sign:

	jnz notZero
	mov rdx, 4
	notZero:
	
	Call ExitProcess

	main ENDP
	END