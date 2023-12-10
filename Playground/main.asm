extern ConvertNumberToASCII: proc
extern WriteLine: proc
extern FlipArray: proc

.data


.code

stringOne db "testing write function",0

main PROC
	
	push rbp
	mov rbp, rsp

	mov rcx, 123
	call ConvertNumberToASCII

	mov rcx, rax
	

	call FlipArray

	mov rcx, rax
	call WriteLine
	
	mov rsp, rbp
	pop rbp

	ret

	main ENDP
	END