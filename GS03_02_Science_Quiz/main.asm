extern Write: proc
extern WriteLine: proc
extern ReadLine: proc
extern ConvertNumberToASCII: proc

.data

promptOne db "Please enter your name: "
 
inputPrompt db "Input (a,b,c,d): ",0

qOne db "What is the speed of light?",13,10,"A) 272,182,455 m/s",13,10,"B) 152,999,982 m/s",13,10,"C) 305,542,123 m/s",13,10,"D) 299,792,458 m/s",0
qTwo db "What is the largest object in the the solar system?",13,10,"A) Sun",13,10,"B) Saturn",13,10,"C) Earth",13,10,"D) Jupiter",0
qThree db "In MASM x64, what register is used to pass the first argument?",13,10,"A) RAX",13,10,"B) R8", 13,10,"C) RCX",13,10,"D) R10",0

outputPromptOne db "You got ",0
outputPromptTwo db "/3",0

score db 0

.code

main PROC

	push rbp
	mov rbp, rsp

	mov rcx, offset qOne
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	; read input
	call ReadLine
	cmp byte ptr [rax], "d"
	jne skipA
	inc score
	skipA:

	mov rcx, offset qTwo
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	; read input
	call ReadLine
	cmp byte ptr [rax], "a"
	jne skipB
	inc score
	skipB:

	mov rcx, offset qThree
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	; read input
	call ReadLine
	cmp byte ptr [rax], "c"
	jne skipC
	inc score
	skipC:

	; output score
	mov rcx, offset outputPromptOne
	call Write

	; score
	xor rcx, rcx
	mov cl, score
	call ConvertNumberToASCII
	mov rcx, rax
	call Write

	mov rcx, offset outputPromptTwo
	call Write

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END