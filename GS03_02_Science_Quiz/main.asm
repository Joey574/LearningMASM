extern Write: proc
extern WriteLine: proc
extern ReadLine: proc
extern ConvertNumberToASCII: proc
extern CopyArray: proc

.data

promptOne db "Please enter your name: "

userName db 256 dup(0)

inputPrompt db "Input (a,b,c,d): ",0
aP db ", "

qOne db "what is the speed of light?",13,10,"A) 272,182,455 m/s",13,10,"B) 152,999,982 m/s",13,10,"C) 305,542,123 m/s",13,10,"D) 299,792,458 m/s",0
qTwo db "what is the largest object in the the solar system?",13,10,"A) Sun",13,10,"B) Saturn",13,10,"C) Earth",13,10,"D) Jupiter",0
qThree db "in MASM x64, what register is used to pass the first argument?",13,10,"A) RAX",13,10,"B) R8", 13,10,"C) RCX",13,10,"D) R10",0

outputPromptOne db "You got ",0
outputPromptTwo db "/3",0

score db 0

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

	; read input
	call ReadLine
	cmp byte ptr [rax], "d"
	je incA
	cmp byte ptr [rax], "D"
	je incA
	jmp skipA
	incA:
	inc score
	skipA:

	mov rcx, offset userName
	call Write
	mov rcx, offset qTwo
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	; read input
	call ReadLine
	cmp byte ptr [rax], "a"
	je incB
	cmp byte ptr [rax], "A"
	je incB
	jmp skipB
	incB:
	inc score
	skipB:

	mov rcx, offset userName
	call Write
	mov rcx, offset qThree
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	; read input
	call ReadLine
	cmp byte ptr [rax], "c"
	je incC
	cmp byte ptr [rax], "C"
	je incC
	jmp skipC
	incC:
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