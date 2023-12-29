ExitProcess PROTO

.data

.code

main PROC

	xor rdx, rdx

	mov rbx, 100
	mov rcx, 200
	cmp rcx, rbx
	ja above
	mov rdx, 1
	above:

	mov rcx, 50
	cmp rcx, rbx
	jb below
	mov rdx, 2
	below:

	mov rcx, 100
	cmp rcx, rbx
	jbe equal
	mov rdx, 3
	equal:

	Call ExitProcess

	main ENDP
	END