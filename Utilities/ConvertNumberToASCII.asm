.data

final db 256 Dup (0)

.code

ConvertNumberToASCII PROC

	push rbp
	mov rbp, rsp
	sub rsp, 32

	mov r10, offset final ; output
	mov byte ptr [r10], "0" ; default return value

	xor rbx, rbx

	convertLoop:
	    mov bl, [rcx] ; Load a byte from the source array
		cmp bl, 0
		je complete
 		add bl, "0"
        mov [r10], bl ; Store the byte in the destination array
        inc rcx ; Move to the next byte in the source array
        inc r10 ; Move to the next byte in the destination array
        jmp convertLoop ; Repeat until all bytes are copied
	complete:

	mov rax, offset final ; output
	
	add rsp, 32
	mov rsp,rbp
    pop rbp

	ret

	ConvertNumberToASCII ENDP
	END