extern GetStdHandle: proc
extern WriteFile: proc

.data

written dq ?

string db 256 dup (0)

.code

    WriteLine PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)
    sub rsp,64    ; reserve 64 bytes for local variables

    mov r10, offset string ; address of local string
    xor r11, r11 ; store string length

    copyLoop:
        mov al, [rcx] ; Load a byte from the source array
        mov [r10], al ; Store the byte in the destination array
        inc rcx ; Move to the next byte in the source array
        inc r10 ; Move to the next byte in the destination array
        inc r11 ; Count string length
        cmp al, 0
        jne copyLoop ; Repeat until all bytes are copied

    ; add new line instruction and adjust length
    mov al, 13
    mov [r10], al
    mov al, 10
    mov [r10+1], al
    add r11, 2

	mov rcx, -11
    call    GetStdHandle
    mov rcx, rax
    mov rdx, offset string
    mov r8, r11
    mov r9, written
    call    WriteFile

    add rsp, 64
    mov rsp,rbp
    pop rbp
    ret 
    
    WriteLine ENDP
	END