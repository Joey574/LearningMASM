.data

.code

CopyArray PROC

	push rbp
	mov rbp, rsp
	sub rsp, 64

	mov rax, [rbp+16]
	mov rbx, [rbp+8]

	 copyLoop:
        mov cl, [rax] ; Load a byte from the source array
        mov [rbx], cl ; Store the byte in the destination array
        inc rax ; Move to the next byte in the source array
        inc rbx ; Move to the next byte in the destination array
        inc rsi ; Count string length
        cmp cl, 0
        jne copyLoop ; Repeat until all bytes are copied
	
	add rsp, 64
	mov rsp,rbp
    pop rbp

	ret

	CopyArray ENDP
	END