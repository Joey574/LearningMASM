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

	mov rcx, offset labelBool
	call Write

	add almostABool, "0"
	mov rcx, offset almostABool
	call WriteLine
	
	; ===== INT VALUE OUTPUT =====

	mov rcx, offset labelInt
	call Write

	; Output intOne
	add intOne, "0"
	mov rcx, offset intOne
	call WriteLine

	mov rcx, offset labelInt
	call Write

	; Output intTwo
	add intTwo, "0"
	mov rcx, offset intTwo
	call WriteLine

	mov rcx, offset labelInt
	call Write

	; Output intThree
	add intThree, "0"
	mov rcx, offset intThree
	call WriteLine

	; ===== CHAR VALUE OUTPUT =====

	mov rcx, offset labelChar
	mov rcx, offset labelChar
	call Write

	; Output char one
	mov rcx, offset charishOne
	call WriteLine

	mov rcx, offset labelChar
	call Write

	; Output char two
	mov rcx, offset charishTwo
	call WriteLine

	mov rcx, offset labelChar
	call Write

	; Output char three
	mov rcx, offset charishThree
	call WriteLine

	; ===== STRING VALUE OUTPUT =====

	mov rcx, offset labelString
	call Write

	; Output string one
	mov rcx, offset stringOne
	call WriteLine

	mov rcx, offset labelString
	call Write

	; Output string one
	mov rcx, offset stringTwo
	call WriteLine

	mov rcx, offset labelString
	call Write

	; Output string one
	mov rcx, offset stringThree
	call WriteLine

	mov rsp,rbp
    pop rbp
	ret

	main ENDP
	END