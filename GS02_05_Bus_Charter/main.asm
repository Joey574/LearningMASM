extern Write: proc
extern WriteLine: proc
extern ConvertNumberToASCII: proc
extern ConvertASCIIToNumber: proc
extern ClearConsole: proc
extern ReadLine: proc
extern CopyArray: proc
extern FlipArray: proc

.data

userName db 256 dup (0)
people dq ?

busCapacity dq 60
vanCapacity dq 7

bussesNeeded dq ?
vansNeeded dq ?

intro db "Hello, please enter your name: ",0
promptA db "Please enter the number of people on the tour ",0
promptB db ": ",0

outPrompt1 db "Busses needed: ",0
outPrompt2 db "Vans needed: ",0

.code

main PROC

	push rbp
	mov rbp, rsp
	sub rsp, 64

	mov rcx, offset intro
	call Write

	; Get name
	call ReadLine
	push rcx ; store length
	mov rcx, rax
	mov rdx, offset userName
	call CopyArray
	pop rcx ; retrieve length

	; add ": " to end of name for output
	mov rdx, offset userName
	add rdx, rcx
	mov byte ptr [rdx], 0 ; remove new line
	mov byte ptr [rdx-1], 0 ; remove new line
	mov word ptr [rdx-2], " :"

	; call ClearConsole

	; First prompt
	mov rcx, offset promptA
	call Write

	; address the user directly + ": "
	mov rcx, offset userName
	call Write

	; Get number
	call readLine
	mov rcx, rax
	call ConvertASCIIToNumber
	mov [people], rax
	; call ClearConsole

	; Logic
	xor edx, edx ; Clear edx, upper 32 bits of dividend
	mov rax, people ; Setting dividend to number of people on tour
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

	mov rcx, offset outPrompt1
	call Write

	mov rcx, bussesNeeded
	call ConvertNumberToASCII
	mov rcx, rax
	call FlipArray
	mov rcx, rax
	call WriteLine

	mov rcx, offset outPrompt2
	call Write

	mov rcx, vansNeeded
	call ConvertNumberToASCII
	mov rcx, rax
	call FlipArray
	mov rcx, rax
	call WriteLine

	add rsp, 64
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END