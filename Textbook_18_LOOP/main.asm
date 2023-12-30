ExitProcess PROTO

.data

.code

main PROC

	xor rdx, rdx
	
	mov rcx, 0
	start:
	mov rdx, rcx
	inc rcx
	cmp rcx, 3
	je finish
	jmp start
	finish:

	Call ExitProcess

	main ENDP
	END