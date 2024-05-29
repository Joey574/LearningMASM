extern ReadLine: proc
extern Write: proc
extern WriteLine: proc
extern CopyArray: proc

MySegment segment read write execute

intro db "Enter the string to encrypt: ",0
instruct db "Enter the number of values to rotate by: ",0

original db 256 dup(0)

main PROC

	lea rax, mylabel

	push rbp
	mov rbp, rsp

	mylabel:

	mov rcx, offset intro

	call Write

	call ReadLine			; get string to encrypt

	push rcx				; store length

	mov rcx, rax			; move string offset into rax
	mov rdx, offset original
	call CopyArray

	mov rcx, offset instruct
	call Write
	
	call Readline			; get number to rotate by

	pop rcx					; get length


	l1:

	dec rcx
	cmp rcx, 0
	jg l1

	
	mov rsp,rbp
    pop rbp

	ret

	main endp

MySegment ends
end