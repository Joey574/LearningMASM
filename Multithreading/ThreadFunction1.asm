extern Write: proc

.data

outputString db "running"

.code

ThreadFunction1 PROC

	push rbp
	mov rbp, rsp

	mov rcx, offset outputString
	call Write

	mov rsp,rbp
    pop rbp

	ret

	ThreadFunction1 ENDP
	END