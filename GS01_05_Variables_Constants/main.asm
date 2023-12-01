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

realOne real8 2.4
realTwo real8 3.8
realThree real8 6.1

.code

main PROC

    push rbp      ; save rbp
    mov rbp,rsp   ; rbp = pointer to return address (8 bytes)

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

	mov Rax, "pleh"
	mov stringTwo, Rax

	mov Rax, "msam"
	mov stringThree, Rax

	; ===== BOOLEAN VALUE OUTPUT =====

	mov rax, " :looB"
	push rax
	call Write

	xor rax, rax
	mov al, almostABool
	add Rax, "0"
	push Rax
	call WriteLine
	
	; ===== INT VALUE OUTPUT =====

	mov rax, " :tnI"
	push rax
	call Write

	; Output intOne
	xor rax, rax
	mov ax, intOne
	add Rax, "0"
	push Rax
	call WriteLine

	mov rax, " :tnI"
	push rax
	call Write

	; Output intTwo
	xor rax, rax
	mov ax, intTwo
	add Rax, "0"
	push Rax
	call WriteLine

	mov rax, " :tnI"
	push rax
	call Write

	; Output intThree
	xor rax, rax
	mov ax, intThree
	add Rax, "0"	
	push Rax
	call WriteLine

	; ===== CHAR VALUE OUTPUT =====

	mov rax, " :rahC"
	push rax
	call Write

	; Output char one
	xor rax, rax
	mov ax, charishOne
	push rax
	call WriteLine

	mov rax, " :rahC"
	push rax
	call Write

	; Output char two
	xor rax, rax
	mov ax, charishTwo
	push rax
	call WriteLine

	mov rax, " :rahC"
	push rax
	call Write

	; Output char three
	xor rax, rax
	mov ax, charishThree
	push rax
	call WriteLine

	; ===== STRING VALUE OUTPUT =====

	mov rax, " :gnirtS"
	push rax
	call Write

	; Output string one
	xor rax, rax
	mov rax, stringOne
	push rax
	call WriteLine

	mov rax, " :gnirtS"
	push rax
	call Write

	; Output string one
	xor rax, rax
	mov rax, stringTwo
	push rax
	call WriteLine

	mov rax, " :gnirtS"
	push rax
	call Write

	; Output string one
	xor rax, rax
	mov rax, stringThree
	push rax
	call WriteLine

	mov rsp,rbp
    pop rbp
	ret

	main ENDP
	END