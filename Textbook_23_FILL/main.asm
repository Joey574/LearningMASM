ExitProcess PROTO

.data
	
	arr qword 0,0,0
	cpy qword 3 dup (0)

.code

main PROC

	lea rdi, arr

	mov rcx, 0
	mov rdx, 10

	start:
	mov [rdi+rcx*8], rdx
	add rdx, 10
	inc rcx
	cmp rcx, lengthof arr
	jne start

	mov r10, arr[0 * 8]
	mov r11, arr[1 * 8]
	mov r12, arr[2 * 8]

	lea rsi, arr
	lea rdi, cpy
	mov rcx, lengthof arr
	cld
	rep movsq

	mov r13, cpy[0 * 8]
	mov r14, cpy[1 * 8]
	mov r15, cpy[2 * 8]

	Call ExitProcess

	main ENDP
	END