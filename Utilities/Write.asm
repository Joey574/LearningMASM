extern GetStdHandle: proc
extern WriteFile: proc

.data

written dq ?

stringAddr dq ?

.code

    Write PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 64 bytes for local variables

    xor r11, r11 ; use to count length
    mov stringAddr, rcx

    copyLoop:
        mov al, [rcx] ; Load a byte from the source array
        inc rcx ; Move to the next byte in the source array
        inc r11 ; Count string length
        cmp al, 0
        jne copyLoop ; Repeat until all bytes are copied

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, stringAddr
    mov r8, r11
    mov r9, written
    call    WriteFile

    add rsp, 64
    mov rsp,rbp
    pop rbp
    ret 
    
    Write ENDP
	END