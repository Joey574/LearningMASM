.data

.code

ClearConsole PROC

	push rbp
	mov rbp, rsp

	mov rsp,rbp
    pop rbp

	ret

	ClearConsole ENDP
	END