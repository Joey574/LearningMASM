
.data

sum qword ?

.code
mainTest PROC

	MOV Rax, 7
	ADD Rax, 4	

	call secondTest

	MOV sum, Rax
	
	ret
	
	mainTest ENDP

secondTest PROC

	add Rax, 4

	ret
	secondTest ENDP

	END