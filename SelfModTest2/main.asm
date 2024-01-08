MySegment segment read write execute

main PROC
	mov eax, 90

	mov qword ptr MyLabel, 4831c048h
	mov dword ptr MyLabel + 8, 0ffc0h

	MyLabel:
		nop
		nop
		nop
		nop
		nop
		nop

	jmp MyLabel
		

		ret

main endp

MySegment ends
end
