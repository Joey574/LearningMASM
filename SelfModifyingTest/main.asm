MySegment segment read write execute

main PROC
	mov eax, 90

	mov dword ptr MyLabel, 90 05 e8 83 h	; nop - 5 - subtract - I think

	MyLabel:
		add eax, 5
		nop ; nop so we don't overwrite ret instruction, which would've been included in the dword otherwise

		ret

main endp

MySegment ends
end
