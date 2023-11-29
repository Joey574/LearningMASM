extern WriteLine: proc
extern Write: proc

.data

string db "test",13,10

.code

main PROC

	push rbp
	mov rbp, rsp

	mov rax, "tset"
	push rax
	call WriteLine
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END