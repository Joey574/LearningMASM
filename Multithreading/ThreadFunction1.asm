extern Write: proc

.data

.code

ThreadFunction1 PROC

	push rbp
	mov rbp, rsp

	mov rax, "gninnur"
	push rax
	call Write

	mov rsp,rbp
    pop rbp

	ret

	ThreadFunction1 ENDP
	END