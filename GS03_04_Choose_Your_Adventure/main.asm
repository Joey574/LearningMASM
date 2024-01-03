extern Write: proc
extern WriteLine: proc
extern ReadLine: proc
extern CopyArray: proc

.data

userName db 256 dup(0)

outPromptStart db "You awake and find yourself in an abandoned mine, you have have no idea where, or who you are.",13,10,"After some minutes of attempting to recall anything, it finally hits you, your name's: ",0

outPromptA db ", after examining the walls around you, you realize there are only 2 ways to go",13,10,"1. Go to your left, a dark narrow tunnel, with no end in sight.",13,10,"2. Go to your right, a tunnel just as narrow, however, you think you see some light in the distance, although it's definitely not natural.",13,10,"3. Stay where you are and hope others find you.",0

outPromptB db "You decide to go left, into the dark tunnel, on the ground there is a baconater, 980 glorious calories.",13,10,"1. Continue down the path, ignoring the baconator",13,10, "2. Contemplate the baconator",13,10,"3. Eat the baconator in all its glory",0
outPromptC db "You decide to go right, towards the light, however, what you find is not an escape, perhaps the fact the light wasn't natural could've helped you come to this conclusion yourself. When you arrive you discover some green goo, glowing in the dark cave.",13,10,"1. Continue down into the dark tunnel, ignoring the goo.",13,10,"2. Eat the green goo.",13,10,"3. Rub the green goo over your body.",0
outPromptD db "You decide to stay where you are, waiting for help, many hours pass by although nothing changes, you start to question your original decision, what will you do now?",13,10,"1. Go to your left, a dark narrow tunnel, with no end in sight.",13,10,"2. Go to your right, a tunnel just as narrow, however, you think you see some light in the distance, although it's definitely not natural.",13,10,"3. Stay where you are, you're a pretty important guy, you think, someone must be looking for you.",0

outPromptE db "Continuing past the baconater, you stumble across in the dark, hoping beyond hope for any chance of escape, finally, before your eyes you see, TWO BACONATORS, in your utter surprise upon this marvel you drop dead due to shock.",0
outPromptF db ", as you sit, contemplating the baconator you feel something happen, you have achieved true enlightenment, easily escaping the cave and escaping into a new world.",0
outPromptG db "You eat the baconator, however, in all its glory, you forgot to account for the caloric overload and die of a heart attack.",0

outPromptH db ", you continue past the green goo, shortly finding an exit, truly quite the escape artist aren't you.",0
outPromptI db ", for some unfathomable reason, you decide to eat the green goo, GLOWING GREEN GOO in the middle of a cave, truly a decision of all time, wait... what's happening... are you... on fire? Oh my, it seems you have been enchanted with",0
outPromptIb db " fire aspect II! With this newfound power you easily manage to cut through the rock and escape the cave",0
outPromptJ db "You're dead... I mean is that really a surprise? What did you think was gonna happen?",0

outPromptK db "You finally decide to get moving, deciding to head toward the dark tunnel, hoping you'll find your way out soon. As you travel through the darkness you hear a noise approaching, a deep rumbling noise growing closer.",0
outpromptKb db " Finally it comes into view. ROY'S MOTHER, rolling towards you with indignity due to her morbid obesity. You try to escape but there is no hope. She is too fat. You are crushed under her weight.",0
outPromptL db " , I'm gonna be honest with you. I'm all creativitied out, just pretend this is really interesting ok? Thanks, I owe you one.",0
outPromptM db ", you are dead, many days have passed since you arrived here, you tricked yourself into waiting for help that was never on its way, in the end it was dehydration and hypothermia that claimed your life.",0

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
		je P1A
		cmp byte ptr [rax], "2"
		je P1B
		cmp byte ptr [rax], "3"
		je P1C
		jmp error

		P1A:
		mov rcx, offset outPromptE
		call WriteLine
		jmp complete

		P1B:
		mov rcx, offset userName
		call Write    
		mov rcx, offset outPromptF
		call WriteLine
		jmp complete

		P1C:
		mov rcx, offset outPromptG
		call WriteLine
		jmp complete


	P2:

		mov rcx, offset outPromptC
		call WriteLine
		mov rcx, offset inputPrompt
		call Write

		call Readline

		cmp byte ptr [rax], "1"
		je P2A
		cmp byte ptr [rax], "2"
		je P2B
		cmp byte ptr [rax], "3"
		je P2C
		jmp error

		P2A:
		mov rcx, offset userName
		call Write
		mov rcx, offset outPromptH
		call WriteLine
		jmp complete

		P2B:
		mov rcx, offset userName
		call Write
		mov rcx, offset outPromptI
		call Write
		mov rcx, offset outPromptIb
		call WriteLine
		jmp complete

		P2C:
		mov rcx, offset outPromptJ
		call WriteLine
		jmp complete

	P3:

		mov rcx, offset outPromptD
		call WriteLine
		mov rcx, offset inputPrompt
		call Write

		call Readline

		cmp byte ptr [rax], "1"
		je P3A
		cmp byte ptr [rax], "2"
		je P3B
		cmp byte ptr [rax], "3"
		je P3C
		jmp error
		
		P3A:
		mov rcx, offset outPromptK
		call Write
		mov rcx, offset outPromptKb
		call WriteLine
		jmp complete

		P3B:
		mov rcx, offset userName
		call Write
		mov rcx, offset outPromptL
		call WriteLine
		jmp complete

		P3C:
		mov rcx, offset userName
		call Write
		mov rcx, offset outPromptM
		call WriteLine
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