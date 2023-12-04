extern WriteLine: proc
extern Write: proc

.data

labelBool db "Bool: ",0
labelInt db "Int: ",0
labelChar db "Char: ",0
labelString db "String: ",0

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

	mov rax, offset labelBool
	push rax
	call Write

	xor rax, rax
	add almostABool, "0"
	mov rax, offset almostABool
	call WriteLine
	
	; ===== INT VALUE OUTPUT =====

	mov rax, offset labelInt
	call Write

	; Output intOne
	xor rax, rax
	add intOne, "0"
	mov Rax, offset intOne
	call WriteLine

	mov rax, offset labelInt
	call Write

	; Output intTwo
	xor rax, rax
	add intTwo, "0"
	mov Rax, offset intTwo
	call WriteLine

	mov rax, offset labelInt
	call Write

	; Output intThree
	xor rax, rax
	add intThree, "0"
	mov Rax, offset intThree
	call WriteLine

	; ===== CHAR VALUE OUTPUT =====

	mov rax, offset labelChar
	call Write

	; Output char one
	xor rax, rax
	mov rax, offset charishOne
	call WriteLine

	mov rax, offset labelChar
	call Write

	; Output char two
	xor rax, rax
	mov rax, offset charishTwo
	call WriteLine

	mov rax, offset labelChar
	call Write

	; Output char three
	xor rax, rax
	mov rax, offset charishThree
	call WriteLine

	; ===== STRING VALUE OUTPUT =====

	mov rax, offset labelString
	call Write

	; Output string one
	xor rax, rax
	mov rax, offset stringOne
	call WriteLine

	mov rax, offset labelString
	call Write

	; Output string one
	xor rax, rax
	mov rax, offset stringTwo
	call WriteLine

	mov rax, offset labelString
	call Write

	; Output string one
	xor rax, rax
	mov rax, offset stringThree
	call WriteLine

	mov rsp,rbp
    pop rbp
	ret

	main ENDP
	END