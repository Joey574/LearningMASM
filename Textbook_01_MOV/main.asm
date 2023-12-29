ExitProcess PROTO

.data

var QWORD 100

.code

main PROC
	
	XOR RCX, RCX
	XOR RDX, RDX

	MOV RCX, 33
	MOV RDX, RCX
	MOV RCX, var
	MOV var, RDX
	
	CALL ExitProcess
	main ENDP
	END