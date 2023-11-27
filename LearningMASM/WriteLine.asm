extern GetStdHandle: proc
extern WriteFile: proc

.data

newLine db 13,10
written dq ?

.code

WriteLine PROC

	mov Rax, 0ah
	call WriteFile

	ret

	WriteLine ENDP
	END