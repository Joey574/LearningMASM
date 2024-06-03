extern ReadLine: proc
extern Write: proc
extern WriteLine: proc
extern CopyArray: proc
extern ConvertASCIIToNumber: proc

MySegment segment read write execute

intro db "Enter the string to encrypt: ",0
instruct db "Enter the number of values to rotate by: ",0

m1 db "The encrypted message is: ",0
m2 db "The decrypted message is: ",0

original db 256 dup(0)
len dq ?
encrypt db ?


main PROC

	; call write
	; e8 07 b0 ff ff
	
	; call writeline
	; e8 f8 af ff ff

	; call readline
	; e8 fd af ff ff

	; call copyarray
	; e8 0c b0 ff ff

	; call convertasciitonumber
	; e8 ed af ff ff

	; mov rcx, offset intro
	; 48 b9 00 60 
	; 34 56 f6 7f 00 00

	push rbp
	mov rbp, rsp

	lea rcx, dataloop
	nop

	mov byte ptr dataloop, 0e8h
	mov dword ptr dataloop + 1, 0ffffb007h 

	mov rcx, offset intro

	dataloop:
	nop
	nop
	nop
	nop
	nop


	encryptloop:


	outputoneloop:



	decryptloop:



	outputtwoloop:
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
MySegment ends
END