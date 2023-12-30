ExitProcess PROTO

.data

.code

main PROC

	xor rdx, rdx
	
	mov rbx, -4
	mov rcx, -1
	cmp rcx, rbx
	jg greater
	mov rdx, 1
	greater:

	mov rcx, -16
	cmp rcx, rbx
	jl less
	mov rdx, 2
	less:

	mov rcx, -4
	cmp rcx, rbx
	jle equal
	mov rdx, 3
	equal:

	cmp rcx, rbx
	jnle notLessOrEqual
	mov rdx, 4
	notLessOrEqual:

	Call ExitProcess

	main ENDP
	END