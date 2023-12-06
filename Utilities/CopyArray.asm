.data

.code

; rcx source array
; rdx desitnation array
CopyArray PROC

	push rbp
	mov rbp, rsp
	sub rsp, 64

	 copyLoop:
        mov r10b, [rcx] ; Load a byte from the source array
        mov [rdx], r10b ; Store the byte in the destination array
        inc rcx ; Move to the next byte in the source array
        inc rdx ; Move to the next byte in the destination array
        cmp r10b, 0
        jne copyLoop ; Repeat until all bytes are copied
	
	add rsp, 64
	mov rsp,rbp
    pop rbp

	ret

	CopyArray ENDP
	END