extern Write: proc
extern WriteLine: proc
extern ReadLine: proc
extern ConvertNumberToASCII: proc
extern CopyArray: proc
extern FlipArray: proc

.data

promptOne db "Please enter your name: "

userName db 256 dup(0)

inputPrompt db "Input (a,b,c,d): ",0
aP db ", "

qOne db "what is the speed of light?",13,10,"A) 272,182,455 m/s",13,10,"B) 152,999,982 m/s",13,10,"C) 305,542,123 m/s",13,10,"D) 299,792,458 m/s",0
qTwo db "what is the largest object in the the solar system?",13,10,"A) Sun",13,10,"B) Saturn",13,10,"C) Earth",13,10,"D) Jupiter",0
qThree db "in MASM x64, what register is used to pass the first argument?",13,10,"A) RAX",13,10,"B) R8", 13,10,"C) RCX",13,10,"D) R10",0

outputPromptOne db "You got ",0
outputPromptTwo db "/12",0

score sByte 0

.code

main PROC

	push rbp
	mov rbp, rsp


	; get name
	mov rcx, offset promptOne
	call Write

	call ReadLine ; get name
	push rcx ; store length
	mov rcx, rax
	mov rdx, offset userName ; destination array
	call CopyArray ; copy source into userName
	pop rcx ; retrieve length

	; add ", " to end of name for output
	mov rdx, offset userName
	add rdx, rcx ; length offset
	mov byte ptr [rdx], 0 ; remove new line
	mov byte ptr [rdx-1], 0 ; remove new line
	mov word ptr [rdx-2], " ,"


	; QUIZ SECTION
	mov rcx, offset userName
	call Write
	mov rcx, offset qOne
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	call ReadLine						; Read Input
	cmp byte ptr [rax], "Z"				; Convert to lower if upper
	jle adjustToLowerA
	jmp L1A								; Check values
	adjustToLowerA:
	add byte ptr [rax], 32				; Adjust to Lower
	L1A:
	cmp byte ptr [rax], "a"				; Check if A
	je L3A
	cmp byte ptr [rax], "b"				; Check if B
	je L3A
	cmp byte ptr [rax], "c"				; Check if C
	je L3A
	cmp byte ptr [rax], "d"				; Check if D
	je L2A
	jmp L4A								; Default
	L2A:								; Correct
	add score, 4
	jmp L4A
	L3A:								; Incorrect
	dec score
	L4A:								; Complete / Default

	mov rcx, offset userName
	call Write
	mov rcx, offset qTwo
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	call ReadLine						; Read Input
	cmp byte ptr [rax], "Z"				; Convert to lower if upper
	jle adjustToLowerB
	jmp L1B								; Check values
	adjustToLowerB:
	add byte ptr [rax], 32				; Adjust to Lower
	L1B:
	cmp byte ptr [rax], "a"				; Check if A
	je L2B
	cmp byte ptr [rax], "b"				; Check if B
	je L3B
	cmp byte ptr [rax], "c"				; Check if C
	je L3B
	cmp byte ptr [rax], "d"				; Check if D
	je L3B
	jmp L4B								; Default
	L2B:								; Correct
	add score, 4
	jmp L4B
	L3B:								; Incorrect
	dec score
	L4B:								; Complete / Default

	mov rcx, offset userName
	call Write
	mov rcx, offset qThree
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	call ReadLine						; Read Input
	cmp byte ptr [rax], "Z"				; Convert to lower if upper
	jle adjustToLowerC
	jmp L1C								; Check values
	adjustToLowerC:
	add byte ptr [rax], 32				; Adjust to Lower
	L1C:
	cmp byte ptr [rax], "a"				; Check if A
	je L3C
	cmp byte ptr [rax], "b"				; Check if B
	je L3C
	cmp byte ptr [rax], "c"				; Check if C
	je L2C
	cmp byte ptr [rax], "d"				; Check if D
	je L3C
	jmp L4C								; Default
	L2C:								; Correct
	add score, 4
	jmp L4C
	L3C:								; Incorrect
	dec score
	L4C:								; Complete / Default

	; output score
	mov rcx, offset outputPromptOne
	call Write

	; score
	xor rcx, rcx
	mov cl, score
	call ConvertNumberToASCII
	mov rcx, rax
	call FlipArray
	mov rcx, rax
	call Write

	mov rcx, offset outputPromptTwo
	call Write

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END