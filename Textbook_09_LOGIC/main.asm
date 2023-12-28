ExitProcess PROTO

.data

.code

main PROC

	xor rcx, rcx
	xor rdx, rdx

	mov rcx, 0101b
	mov rdx, 0011b

	xor rcx, rdx
	and rcx, rdx
	or rcx, rdx

	call ExitProcess

	main ENDP
	END