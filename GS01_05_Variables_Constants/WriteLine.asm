extern GetStdHandle: proc
extern WriteFile: proc

.data

newLine db 13,10
written dq ?

.code

    WriteLine PROC

	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset newLine  ; set message address as second argument
    mov r8, 2             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

    ret 
    
    WriteLine ENDP
	END