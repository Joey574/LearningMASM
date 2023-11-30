xtern GetStdHandle: proc
extern WriteFile: proc

.data

written dq ?

string DQ ?
len Dq ?

.code

PUBLIC WriteLine 
    WriteLine PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 64 bytes for local variables

    mov rax, [rbp+16]
    mov string, rax

    xor rcx, rcx
    mov rbx, 0d0ah
    loc:
    shr rax, 8
    shl rbx, 8
    inc rcx
    cmp rax, 0
    jne loc

    add string, rbx

    mov len, rcx
    add len, 2

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, offset string
    mov r8, len
    mov r9, written
    call    WriteFile

    add rsp, 64
    mov rsp,rbp
    pop rbp
    ret 
    
    WriteLine ENDP
	END