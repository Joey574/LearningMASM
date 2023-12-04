.data

final db 256 Dup (0)

.code

ConvertNumberToASCII PROC

	push rbp
	mov rbp, rsp
	sub rsp, 32

	mov rcx, offset final

	xor rbx, rbx

	convertLoop:
	    mov bl, [rax] ; Load a byte from the source array
		cmp bl, 0
		je complete
 		add bl, "0"
        mov [rcx], bl ; Store the byte in the destination array
        inc rax ; Move to the next byte in the source array
        inc rcx ; Move to the next byte in the destination array
        jmp convertLoop ; Repeat until all bytes are copied
	complete:

	mov rax, offset final
	
	add rsp, 32
	mov rsp,rbp
    pop rbp

	ret

	ConvertNumberToASCII ENDP
	END