MySegment segment write read execute

; actual code
binary db 11111111b,11001000b,10000011b,11111000b,00000000b,01111111b,11111001b

main PROC

	push rbp
	mov rbp, rsp

	lea rcx, MyLabel
	nop

	; copy machine code into mylabel location
	mov rsi, offset binary
    mov rdi, MyLabel
    mov ecx, 7

	copy_loop:
		movsb
		loop copy_loop

	mov rax, 0fh

	MyLabel:
		nop				; replaced w dec
		nop				; replaced w dec
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w jg
		nop				; replaced w jg


	nop
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	mysegment ends
	END