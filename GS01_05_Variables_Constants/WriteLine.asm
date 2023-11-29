extern GetStdHandle: proc
extern WriteFile: proc

.data

newLine db 13,10
written dq ?

.code

    WriteLine PROC

    sub rsp, 32

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, offset newLine
    mov r8, 2
    mov r9, written
    call    WriteFile

    add rsp, 32

    ret 
    
    WriteLine ENDP
	END