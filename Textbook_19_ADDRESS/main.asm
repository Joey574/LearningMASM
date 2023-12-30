ExitProcess PROTO

.data

a byte 10
b byte 20
c db 30
d db 40

.code

main PROC

	xor rdx, rdx

	mov al, a
	mov ah, a + 3

	lea rcx, b

	mov dl, [rcx]
	mov dh, [rcx] + 1

	Call ExitProcess

	main ENDP
	END