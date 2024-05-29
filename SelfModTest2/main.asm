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
	mov dword ptr MyLabel + 2, 9000f883h

	MyLabel:
		inc eax			; replaced w dec eax
		nop				; next 3 replaced with cmp eax, 0
		nop
		nop
		nop				; nop to prevent overwriting jg

		jg MyLabel


	nop

	ret

main endp

MySegment ends
end
