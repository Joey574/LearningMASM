MySegment segment read write execute

main PROC
	mov eax, 90

	mov dword ptr MyLabel, 9005e883h	; nop - 5 - subtract - I think 90 - nop : 05 - #5 : e883 - Subtract eax

	MyLabel:
		add eax, 5
		nop									; nop so we don't overwrite ret instruction, which would've been included in the dword otherwise

		ret

main endp

MySegment ends
end