extern GetStdHandle: proc
extern ReadFile: proc

.data


bufferSize	equ 255
buffer      db bufferSize dup (?)
bytesRead	db ?

.code

ReadLine PROC

	push rbp
	mov rbp, rsp
    sub rsp,64    ; reserve 64 bytes for local variables

    mov rcx, -10
    call    GetStdHandle
        mov rcx, rax
        mov rdx, offset buffer
        mov r8, bufferSize
        mov r9, offset bytesRead
    call ReadFile

	; Null-terminate the input string
    ;mov     byte ptr [buffer + bytesRead], 0

    mov rax, offset buffer ; first return

    xor rcx, rcx
    mov cl, bytesRead ; idk where a 2nd return value is supposed to go so I'll put it here

    add rsp,64    ; reserve 64 bytes for local variables
	mov rsp,rbp
    pop rbp

	ret

	ReadLine ENDP
	END