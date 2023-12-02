extern Write: proc
extern WriteLine: proc

.data

userName db 256 dup (0)
people dq ?

bus dq 60
van dq 7

bussesNeeded dq ?
vansNeeded dq ?

intro db "Hello, please enter your name: ",0
prompt db "Please enter the number of people on the tour: ",0

outPrompt1 db "Busses needed: ",0
outPrompt2 db "Vans needed: ",0

.code

main PROC

	push rbp
	mov rbp, rsp

	mov rax, offset intro
	push rax
	call Write

	mov rax, offset prompt
	push rax
	call Write

	; Get number

	mov rax, 84
	mov [people], rax

	mov rax, people ; Setting number of people on tour
	xor edx, edx ; Clear edx, upper 32 bits of dividend
	mov rcx, bus ; Set divider, in this case 60

	div rcx ; Divide

	mov [bussesNeeded], rax ; Get number of busses needed
	mov rax, rdx ; Move into rax the remainder, setting up for next div operation
	xor edx, edx ; Clear upper 32 bits again
	mov rcx, van ; Set divider, in this case 7
	
	div rcx ; Divide

	mov [vansNeeded], rax ; Get number of busses needed
	cmp rdx, 0 ; Check if remainder is 0
	je skip ; If it is equal skip
	inc vansNeeded ; If not equal inc one more van
	skip:

	mov rax, offset outPrompt1
	push rax
	call Write

	mov rax, offset bussesNeeded
	push rax
	call ConvertNumberToASCII
	pop rax
	call WriteLine

	mov rax, offset outPrompt2
	push rax
	call Write

	mov rax, offset bussesNeeded
	push rax
	call ConvertNumberToASCII
	pop rax
	call WriteLine

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END