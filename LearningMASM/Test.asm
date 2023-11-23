
.data

sum qword ?

.code
mainTest PROC

	MOV Rax, 7
	ADD Rax, 4	
	MOV sum, Rax
	
	ret
	
	mainTest ENDP
	END