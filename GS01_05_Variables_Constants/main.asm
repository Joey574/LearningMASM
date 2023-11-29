extern GetStdHandle: proc
extern WriteFile: proc
extern WriteLine: proc
extern Write: proc

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

	 mov Rax, "gnirts"
	 mov stringOne, Rax

	 mov Rax, "help"
	 mov stringTwo, Rax

	 mov Rax, "masm"
	 mov stringThree, Rax

	 push stringOne
	 mov rax, 6
	 push rax

	 call Write
	 
	 ;call WriteLine
	 ;call WriteLine

	 nop

	 ; ===== BOOLEAN VALUE OUTPUT =====
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

	call WriteLine

	; ===== INT VALUE OUTPUT =====
	mov ax, intOne
	add Rax, "0"
	mov [intOne], ax

	mov ax, intTwo
	add Rax, "0"
	mov [intTwo], ax

	mov ax, intThree
	add Rax, "0"
	mov [intThree], ax

	; outputs intOne
	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset intOne  ; set message address as second argument
    mov r8, 1             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

	call WriteLine

	; outputs intTwo
	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset intTwo  ; set message address as second argument
    mov r8, 1             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

	call WriteLine

	; outputs intThree
	mov rcx, -11
    call    GetStdHandle    ; get stdout file handle
    mov rcx, rax            ; set as first parameter
    mov rdx, offset intThree  ; set message address as second argument
    mov r8, 1             ; length as third
    mov r9, written         ; variable to write # bytes written
    call    WriteFile       ; prints message to console

	call WriteLine


	
	ret

	main ENDP
	END