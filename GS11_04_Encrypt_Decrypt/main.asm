extern ReadLine: proc
extern Write: proc
extern WriteLine: proc
extern CopyArray: proc

MySegment segment read write execute

intro db "Enter the string to encrypt: ",0
instruct db "Enter the number of values to rotate by: ",0

m1 db "The encrypted message is: ",0
m2 db "The decrypted message is: ",0

original db 256 dup(0)
len dq ?
encrypt db ?

main PROC

	lea rax, mylabel

	push rbp
	mov rbp, rsp

	mylabel:

	mov rcx, offset intro

	call Write

	call ReadLine			; get string to encrypt

	push rcx				; store length

	mov rcx, rax				; move string offset into rax
	mov rdx, offset original	; get ready to copy message into variable
	call CopyArray

	mov rcx, offset instruct	; write instructions for encrypt value
	call Write
	
	call Readline			; get number to rotate by

	mov [encrypt], al		; store encrypt value

	pop rcx					; get length
	mov [len], rcx			; store length


	; loop to modify original message into encrypted one
	l1:
		add [original], encrypt

		dec rcx
		cmp rcx, 0
		jg l1


	; Write encrypted message to screen
	mov rcx, offset m1
	call Write
	mov rcx, offset original
	call WriteLine


	; loop to modify encrypted message into decrypted one
	mov rcx, len
	l2:
		sub [original], encrypt		
		
		dec rcx
		cmp rcx, 0
		jg l2

	; Write message and decrytped message
	mov rcx, offset m2
	call Write
	mov rcx, offset original
	call WriteLine
	
	mov rsp,rbp
    pop rbp

	ret

	main endp

MySegment ends
end