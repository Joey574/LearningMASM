MySegment segment read write execute

main PROC
	mov rax, 0fh
	lea rcx, MyLabel

	mov word ptr MyLabel, 0c8ffh		; dec eax
	mov dword ptr MyLabel + 2, 00f883h	; cmp eax w/ 0
	mov word ptr MyLabel + 5, 0f97fh	; jg MyLabel

	MyLabel:
		nop
		nop
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w jg
		nop				; replaced w jg

	ret

main endp

MySegment ends
end
