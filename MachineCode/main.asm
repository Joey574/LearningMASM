MySegment segment write read execute

machine db 0ffh,0c8h,083h,0f8h,00h,07fh,0f9h
binary db 11111111b,11001000b,10000011b,11111000b,00000000b,00000111b,11111001b

main PROC

	push rbp
	mov rbp, rsp

	lea rcx, MyLabel
	nop

	; copy machine code into mylabel location
	mov rsi, offset machine
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