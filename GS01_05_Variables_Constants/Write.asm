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
    shl rax, 4
    mov string, rax

    nop

    mov rsi,OFFSET string ; load the address of the string into RSI
    xor rcx,rcx ; zero out RCX
    cld ; clear the direction flag
    mov cl,255 ; set the maximum length of the string to 255
    repne scasb ; scan the string until we find a null terminator
    mov rax,0 ; zero out RAX
    sub rax,rcx ; subtract the length of the string from RAX
    dec rax ; decrement RAX to account for the null terminator
    mov len, rax

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