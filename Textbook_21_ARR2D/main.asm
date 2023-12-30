ExitProcess PROTO

.data

	rows byte 0,1,2,3,  10,11,12,11,  20,21,22,23
	cols byte 0,10,20,  1,11,21,  2,12,22,  3,13,23
	arrA dword 0,1,2,3,  10,11,12,13,  20,21,22,23
	arrB dword 0,10,20,  1,11,21,  2,12,22,  3,13,23
	
.code

main PROC

	mov cl, rows
	mov ch, cols
	mov r8d, arrA
	mov r9d, arrB

	mov cl, rows + 5
	mov ch, cols + 4

	mov r8d, arrA + (8 * 4)
	mov r9d, arrB + (2 * 4)

	Call ExitProcess

	main ENDP
	END