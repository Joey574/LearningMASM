extern GetStdHandle: proc
extern WriteFile: proc

.data

newLine db 13,10
written dq ?

.code

    WriteLine PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 32 bytes for local variables

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, offset newLine
    mov r8, 2
    mov r9, written
    call    WriteFile

    add rsp, 64
    mov rsp,rbp
    pop rbp
ret 
    
    WriteLine ENDP
	END