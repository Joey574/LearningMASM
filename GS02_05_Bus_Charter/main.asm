extern Write: proc
extern WriteLine: proc
extern ConvertNumberToASCII: proc
extern ClearConsole: proc

.data

userName db 256 dup (0)
people dq ?

busCapacity dq 60
vanCapacity dq 7

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
	sub rsp, 64

	mov rax, offset intro
	call Write

	; Get name
	call ClearConsole

	mov rax, offset prompt
	call Write

	; Get number
	call ClearConsole

	; Test purposes for logic
	mov rax, 84
	mov [people], rax

	; Logic
	mov rax, people ; Setting dividend to number of people on tour
	xor edx, edx ; Clear edx, upper 32 bits of dividend
	mov rcx, busCapacity ; Set divider, in this case 60

	div rcx ; Divide

	mov [bussesNeeded], rax ; Store number of busses needed
	mov rax, rdx ; Move into rax the remainder, setting up for next div operation
	xor edx, edx ; Clear upper 32 bits again
	mov rcx, vanCapacity ; Set divider, in this case 7
	
	div rcx ; Divide

	mov [vansNeeded], rax ; Store number of vans needed
	cmp rdx, 0 ; Check if remainder is 0
	je skip ; If it is, skip
	inc vansNeeded ; If not equal inc one more van
	skip:

	mov rax, offset outPrompt1
	call Write

	mov rax, offset bussesNeeded
	call ConvertNumberToASCII
	call WriteLine

	mov rax, offset outPrompt2
	call Write

	mov rax, offset vansNeeded
	call ConvertNumberToASCII
	call WriteLine

	add rsp, 64
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END