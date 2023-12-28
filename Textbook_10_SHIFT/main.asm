ExitProcess PROTO

.data

unum byte 10011001b
sneg sbyte 10011001b
snum sbyte 00110011b

.code

main PROC

	xor rcx, rcx
	xor rdx, rdx
	xor r8, r8

	mov cl, unum
	mov dl, sneg
	mov r8b, snum

	shr cl, 2
	sar dl, 2
	sar r8, 2

	call ExitProcess

	main ENDP
	END