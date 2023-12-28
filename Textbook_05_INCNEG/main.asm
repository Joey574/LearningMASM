ExitProcess PROTO

.data

var dq 99

.code

main PROC

	xor rcx, rcx

	inc var
	mov rcx, 51
	dec rcx
	neg rcx

	call ExitProcess

	main ENDP
	END