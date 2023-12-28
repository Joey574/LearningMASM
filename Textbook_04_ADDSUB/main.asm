ExitProcess PROTO

.data

	var dq 64

.code

main PROC

	xor rcx, rcx
	xor rdx, rdx

	mov rcx, 36
	add rcx, var
	mov rdx, 400
	add rdx, rcx
	sub rcx, 100

	call ExitProcess

	main ENDP
	END