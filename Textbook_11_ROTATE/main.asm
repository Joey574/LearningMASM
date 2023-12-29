ExitProcess PROTO

.data

.code

main PROC

	xor rcx, rcx
	
	mov cl, 65
	mov ch, 90

	rol cx, 8

	rol cx, 8
	shr cx, 8

	CALL ExitProcess
	main ENDP
	END