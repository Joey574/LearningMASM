extern Write: proc

.data

.code

stringOne db "testing write function",0

main PROC
	
	push rbp
	mov rbp, rsp

	lea rax, stringOne
	push rax
	
	call Write

	mov rsp, rbp
	pop rbp

	ret

	main ENDP
	END