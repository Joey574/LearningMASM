extern Write: proc
extern WriteLine: proc
extern ReadLine: proc
extern CopyArray: proc

.data

userName db 256 dup(0)

outPromptStart db "You awake and find yourself in an abandoned mine, you have have no idea where, or who you are.",13,10,"After some minutes of attempting to recall anything, it finally hits you, your name's: ",0

outPromptA db ", after examining the walls around you, you realize there are only 2 ways to go",13,10,"1. Go to your left, a dark narrow tunnel, with no end in sight.",13,10,"2. Go to your right, a tunnel just as narrow, however, you think you see some light in the distance, although it's definitely not natural.",13,10,"3. Stay where you are and hope others find you.",0

outPromtpB db "You decide to go left, into the dark tunnel"
outPromtpC db "You decide to go right, towards the light"
outPromtpD db "You decide to stay where you are, waiting for help, many hours pass by although nothing changes, you start to question your original decision, what will you do now?",13,10,"1. Go to your left, a dark narrow tunnel, with no end in sight.",13,10,"2. Go to your right, a tunnel just as narrow, however, you think you see some light in the distance, although it's definitely not natural.",13,10,"3. Stay where you are, you're a pretty important guy, you think, someone must be looking for you.",0

;outPromtpE db ""
;outPromtpF db ""
;outPromtpG db ""

;outPromtpH db ""
;outPromtpI db ""
;outPromtpJ db ""

;outPromtpK db ""
;outPromtpL db ""
outPromtpM db ", you are dead, many days have passed since you arrived here, you tricked yourself into waiting for help that was never on its way, in the end it was dehydration and hypothermia that claimed your life.",0

errorPrompt db "User input does not match required field, program stoppped",0

inputPrompt db "Input (1,2,3): ",0



.code

main PROC

	push rbp
	mov rbp, rsp

	mov rcx, offset outPromptStart
	call Write
	
	call ReadLine ; get name
	push rcx ; store length
	mov rcx, rax
	mov rdx, offset userName ; destination array
	call CopyArray ; copy source into userName
	pop rcx ; retrieve length

	; remove new line from name
	mov rdx, offset userName
	add rdx, rcx ; length offset
	mov word ptr [rdx-2], 0 ; remove new line

	mov rcx, offset userName
	call Write
	mov rcx, offset outPromptA
	call WriteLine
	mov rcx, offset inputPrompt
	call Write

	call ReadLine

	cmp byte ptr [rax], "1"
	je P1
	cmp byte ptr [rax], "2"
	je P2
	cmp byte ptr [rax], "3"
	je P3
	jmp error

	P1:

		mov rcx, offset outPromptB
		call WriteLine
		mov rcx, offset inputPrompt
		call Write

		call Readline

		cmp byte ptr [rax], "1"
		je P1
		cmp byte ptr [rax], "2"
		je P2
		cmp byte ptr [rax], "3"
		je P3
		jmp error

		P1A:
		jmp complete

		P1B:
		jmp complete

		P1C:
		jmp complete


	P2:

		P2A:
		jmp complete

		P2B:
		jmp complete

		P2C:
		jmp complete

	P3:
		
		P3A:
		jmp complete

		P3B:
		jmp complete

		P3C:
		jmp complete
		
	error:

	mov rcx, offset errorPrompt
	call WriteLine

	complete:
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END