.data

valueArray db 256 dup(0)
len dq ?

.code

; rcx, pointer to asci values
; assumes array ends in a newline
ConvertASCIIToNumber PROC

	push rbp
	mov rbp, rsp

	xor r10, r10 ; store byte values
	xor r11, r11 ; store number of loops
	xor rax, rax ; store final value

	mov r11, offset valueArray

	; loop to count length
	copyLoop:

		mov r10b, [rcx] ; Load a byte from the source array
		cmp r10b, 13 ; check if newline
		je skip ; if so skip
		sub r10b, "0" ; adjust to real num
        mov [r11], r10b ; Store the byte in the destination array
        inc rcx ; Move to the next byte in the source array
        inc r11 ; Move to the next byte in the destination array
		inc rax ; count length
        cmp r10b, 0
        jne copyLoop ; Repeat until all bytes are copied
	skip:

	mov len, rax

	xor r11, r11 ; store counter 
	xor rcx, rcx ; store final
	mov r10, offset valueArray ; store value array pointer
	mov rbx, 10

	FinalOutLoop:
		xor rax, rax ; prep for move
		mov al, byte ptr [r10] ; store byte
		inc r11

		cmp r11, len
		jl multiplyValues ; see if there are more bytes to add
		back:

		add rcx, rax ; store final

		inc r10
		cmp r11, len ; compare length with loop counter
		je OutSkip ; if equal, finish
		jmp FinalOutLoop ; else repeat

	multiplyValues:
	mul rbx
	jmp back
	OutSkip:

	mov rax, rcx ; store final in rax

	mov rsp,rbp
    pop rbp

	ret

	ConvertASCIIToNumber ENDP
	END