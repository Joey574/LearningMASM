extern GetStdHandle: proc
extern WriteFile: proc

.data

written dq ?

string DQ ?
len Dq ?

.code

    Write PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 64 bytes for local variables

    mov rax, [rbp+16]
    mov string, rax
    mov rax, [rbp+10]

    mov len, rax

    nop

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, offset string
    mov r8, 2
    mov r9, written
    call    WriteFile

    mov rsp,rbp
    pop rbp
    ret 
    
    Write ENDP
	END