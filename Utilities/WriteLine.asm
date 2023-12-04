extern GetStdHandle: proc
extern WriteFile: proc

.data

written dq ?

string db 256 dup (0)
len DQ ?

.code

    WriteLine PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 64 bytes for local variables

    mov rbx, offset string
    xor rcx, rcx
    xor rsi, rsi

    copyLoop:
        mov cl, [rax] ; Load a byte from the source array
        mov [rbx], cl ; Store the byte in the destination array
        inc rax ; Move to the next byte in the source array
        inc rbx ; Move to the next byte in the destination array
        inc rsi ; Count string length
        cmp cl, 0
        jne copyLoop ; Repeat until all bytes are copied

    mov cl, 13
    mov [rbx], cl
    mov cl, 10
    mov [rbx+1], cl
    add rsi, 2

    mov len, rsi

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