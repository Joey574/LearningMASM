.data

array DQ 809600 dup (0)

.code

main PROC

	push rbp
	mov rbp, rsp

	mov rax, offset array
	xor rcx, rcx

	ramloop:
		mov byte ptr [rax], 255
		inc rax
		inc rcx
		cmp rcx, 809600
		jle ramloop

	pauseLoop:
		jmp pauseLoop
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END