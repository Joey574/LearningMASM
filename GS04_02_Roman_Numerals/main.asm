Extern WriteLine: proc
Extern Write: proc
Extern ReadLine: proc
Extern ConvertASCIIToNumber: proc
Extern CopyArray: proc

.data

inputPrompt db "Input Number (1-3999): ",0
outputNum db 256 dup (0)
inputNum dq ?

outputPromptA db "Your Number: ",0
outputPromptB db "Enter 1 to repeat, all else to exit: ",0
errorPrompt db "ERROR, number entered is too large, exiting program ",0

.code

main PROC

	push rbp
	mov rbp, rsp

	start:

	mov rcx, offset inputPrompt
	call Write

	call ReadLine ; get input as ascii

	mov rcx, rax
	call ConvertASCIIToNumber

	mov inputNum, rax

	mov r10, offset outputNum
	mov r11, inputNum

	cmp r11, 4000
	jge error
	cmp r11, 1
	jl error

	L1:
	cmp r11, 1000
	jl L2
	mov byte ptr [r10], "M"
	inc r10
	sub r11, 1000
	cmp r11, 1000
	jge L1
	L2:
	cmp r11, 900
	jl L3
	mov word ptr [r10], "CM"
	inc r10
	inc r10
	sub r11, 900
	cmp r11, 900
	jge L2
	L3:
	cmp r11, 500
	jl L4
	mov byte ptr [r10], "D"
	inc r10
	sub r11, 500
	cmp r11, 500
	jge L3
	L4:
	cmp r11, 400
	jl L5
	mov word ptr [r10], "CD"
	inc r10
	inc r10
	sub r11, 400
	cmp r11, 400
	jge L4
	L5:
	cmp r11, 100
	jl L6
	mov byte ptr [r10], "C"
	inc r10
	sub r11, 100
	cmp r11, 100
	jge L5
	L6:
	cmp r11, 90
	jl L7
	mov word ptr [r10], "XC"
	inc r10
	inc r10
	sub r11, 90
	cmp r11, 90
	jge L6
	L7:
	cmp r11, 50
	jl L8
	mov byte ptr [r10], "L"
	inc r10
	sub r11, 50
	cmp r11, 50
	jge L7
	L8:
	cmp r11, 40
	jl L9
	mov word ptr [r10], "XL"
	inc r10
	inc r10
	sub r11, 40
	cmp r11, 40
	jge L8
	L9:
	cmp r11, 10
	jl L10
	mov byte ptr [r10], "X"
	inc r10
	sub r11, 10
	cmp r11, 10
	jge L9
	L10:
	cmp r11, 9
	jl L11
	mov word ptr [r10], "IX"
	inc r10
	inc r10
	sub r11, 9
	cmp r11, 9
	jge L10
	L11:
	cmp r11, 5
	jl L12
	mov byte ptr [r10], "V"
	inc r10
	sub r11, 5
	cmp r11, 5
	jge L11
	L12:
	cmp r11, 4
	jl L13
	mov word ptr [r10], "IV"
	inc r10
	inc r10
	sub r11, 4
	cmp r11, 4
	jge L12
	L13:
	cmp r11, 1
	jl complete
	mov byte ptr [r10], "I"
	inc r10
	sub r11, 1
	cmp r11, 1
	jge L13
	complete:
	

	mov rcx, offset outputPromptA
	call Write
	mov rcx, offset outputNum
	call WriteLine
	mov rcx, offset outputPromptB
	call Write

	call Readline

	cmp byte ptr [rax], "1"
	je start
	jmp done

	error:
	mov rcx, offset errorPrompt
	call WriteLine

	done:

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END