ExitProcess PROTO

.data

.code

main PROC

	xor rcx, rcx

	mov cl, 255
	add cl, 1
	dec cl
	mov cl, 127
	add cl, 1

	Call ExitProcess

	main ENDP
	END