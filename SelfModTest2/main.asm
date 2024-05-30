MySegment segment read write execute

main PROC
	mov eax, 90
	lea rcx, MyLabel

	; ff c8                   dec    eax
    ; 83 f8 00                cmp    eax,0x0
    ; 0f 8f 00 00 00 00       jg     b <_main+0xb>

	; c8 ff
	; 00 f8 83
	; 00 00 00 00 8f 0f


	mov word ptr MyLabel, 0c8ffh
	mov dword ptr MyLabel + 2, 00f883h
	mov word ptr MyLabel + 5, 0f87fh

	; 7f f8
	; 7f f7
	; 7f f6

	MyLabel:
		inc eax			; replaced w dec eax
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w cmp
		nop				; replaced w jg
		nop				; replaced w jg

	nop

	ret

main endp

MySegment ends
end
