
.data

sum qword ?

.code
main PROC

	MOV Rax, 7
	ADD Rax, 4	
	MOV sum, Rax
	
	ret
	
	main ENDP
	END