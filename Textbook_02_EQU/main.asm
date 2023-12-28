ExitProcess PROTO

.data
	con EQU 12
.code

main PROC
	MOV RCX, con
	MOV RDX, con + 8
	MOV RCX, con + 8 * 2
	MOV RDX, (con + 8) * 2
	MOV RCX, con MOD 5
	MOV RDX, (con - 3) / 3
	
	Call ExitProcess

	main ENDP
	END