extern ReadLine: proc
extern Write: proc
extern WriteLine: proc
extern CopyArray: proc
extern ConvertASCIIToNumber: proc

MySegment segment read write execute

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

	push rbp
	mov rbp, rsp

	lea rcx, dataloop
	nop
	nop

	dataloop:


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