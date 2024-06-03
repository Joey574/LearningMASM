MySegment segment write read execute

machine db 0c8h,0ffh,00,0f8h,083h,0f9h,07fh

main PROC

	push rbp
	mov rbp, rsp

	lea rcx, MyLabel
	lea rax, machine

	mov esi, [machine]               ; Load source address into SI
    mov edi, MyLabel              ; Load destination address into DI
    mov ecx, 7                     ; Number of bytes to move

	copy_loop:
		movsb                           ; Move a byte from [SI] to [DI]
		loop copy_loop                  ; Repeat until CX becomes zero

		nop
	

	MyLabel:
		inc eax			; replaced w dec eax
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