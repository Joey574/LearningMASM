MySegment segment read write execute

main PROC
	mov eax, 90

	mov dword ptr MyLabel, 9005e883h

	MyLabel:
		add eax, 5
		nop

		ret

main endp

MySegment ends
end
