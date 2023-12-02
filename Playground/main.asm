extern Write: proc

.data

.code

stringOne db 64 dup (?)
stringTwo db "testing write function",0

main PROC
	
	push rbp
	mov rbp, rsp

	lea rax, stringTwo
	push rax
	
	call Write

	mov rsp, rbp
	pop rbp

	ret

	main ENDP
	END