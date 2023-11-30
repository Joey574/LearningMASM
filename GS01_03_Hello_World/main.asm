extern GetStdHandle: proc
extern WriteFile: proc

.data?
    written dq ?

.data

stringOne db "Hello World!",13,10
lenOne equ $-stringOne

stringTwo db "Second String!",13,10
lenTwo equ $-stringTwo

stringThree db "Help Me!",13,10
lenThree equ $-stringThree

stringFour db "I hate masm!",13,10
lenFour equ $-stringFour


.code
main PROC

    push rbp
	mov rbp, rsp
    sub rsp, 32

    ; Output "Hello World!"
	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset stringOne  ; set message address as second argument
    mov r8, lenOne             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console
    
    ; Output "Second String!"
    mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, offset stringTwo
    mov r8, lenTwo
    mov r9, written
    call    WriteFile

    ; Output "Help Me!"
     mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, offset stringThree
    mov r8, lenThree
    mov r9, written
    call    WriteFile

    ; Output "I hate masm!"
     mov rcx, -11
    call GetStdHandle
    mov rcx, rax
    mov rdx, offset stringFour
    mov r8, lenFour
    mov r9, written
    call    WriteFile

    add rsp, 32
	mov rsp, rbp
    pop rbp

    ret

	main ENDP
	END