extern GetStdHandle: proc
extern WriteFile: proc
extern WriteLine: proc

.data

newLine db 13,10

written dq ?

almostABool byte ?

intOne dw ?
intTwo dw ?
intThree dw ?

charishOne word ?
charishTwo word ?
charishThree word ?

stringOne qword ?
stringTwo qword ?
stringThree qword ?

realOne real8 ?
realTwo real8 ?
realThree real8 ?

.code

main PROC

	; init bool
	mov Rax, 1
	mov [almostABool], al

	; init ints
	mov Rax, 1
	mov [intOne], ax

	mov Rax, 6
	mov [intTwo], ax

	mov Rax, 2
	mov [intThree], ax
	
	; init char

	 mov Rax, 0feff0041h
	 mov charishOne, ax

	 mov Rax, 0feff0043h
	 mov charishTwo, ax

	 mov Rax, 0feff0045h
	 mov charishThree, ax

	 mov Rax, "string"
	 mov stringOne, Rax

	 mov Rax, "help"
	 mov stringTwo, Rax

	 mov Rax, "masm"
	 mov stringThree, Rax

	 mov al, almostABool
	 add Rax, "0"
	 mov [almostABool], al

	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset almostABool  ; set message address as second argument
    mov r8, 1             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

	sub rsp, 32
	call WriteLine
	add rsp, 32

	mov ax, intOne
	add Rax, "0"
	mov [intOne], ax

	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset intOne  ; set message address as second argument
    mov r8, 1             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console
	
	ret

	main ENDP
	END