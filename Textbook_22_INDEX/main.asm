ExitProcess PROTO

.data

	arr qword 10,20,30

.code

main PROC

	lea rsi, arr
	mov rcx, 0

	start:
	mov rdx, [rsi + rcx * 8]

	inc rcx
	cmp rcx, lengthof arr
	jne start

	Call ExitProcess

	main ENDP
	END