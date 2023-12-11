.data

final db 256 Dup (0)
divVal dd 10

endZero db 0

.code

; rcx, value to convert to ASCII
; rax, return of adress of array
ConvertNumberToASCII PROC

	push rbp
	mov rbp, rsp
	sub rsp, 32

	mov r10, offset final ; output
	mov byte ptr [r10], "0" ; default return value

	xor rdx, rdx

	mov rax, rcx

	cmp rax, 10
	jl skip
	inc endZero
	skip:

	divLoop:

		; div rax by 10
		div divVal

		add dl, "0"
		mov [r10], dl
		inc r10
		xor dl, dl ; clear remainder

		cmp rax, 10
		jg divLoop

	cmp endZero, 0
	je skipZero
	add al, "0"
	mov [r10], al
	skipZero:

	mov rax, offset final ; output

	add rsp, 32
	mov rsp,rbp
    pop rbp

	ret

	ConvertNumberToASCII ENDP
	END