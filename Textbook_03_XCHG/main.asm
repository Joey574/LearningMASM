ExitProcess PROTO

.data
var QWORD ?

.code

main PROC
	
	xor rcx, rcx
	xor rdx, rdx

	mov rcx, 5
	xchg rcx, var
	mov dl, 3
	xchg dh, dl
	
	Call ExitProcess

	main ENDP
	END