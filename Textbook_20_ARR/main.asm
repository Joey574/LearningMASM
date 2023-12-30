ExitProcess PROTO

.data

	arrA byte 1,2,3
	arrB word 10,20,30
	arrC dword 100,200,300
	arrD qword 1000,2000,3000

.code

main PROC

	mov cl, arrA
	mov dx, arrB
	mov r8d, arrC
	mov r9, arrD

	mov cl, arrA + 1
	mov dx, arrB + 2
	mov r8d, arrC + 4
	mov r9, arrD + 8

	mov cl, arrA + (2 * 1)
	mov dx, arrB + (2 * 2)
	mov r8d, arrC + (2 * 4)
	mov r9, arrD + (2 * 8)

	Call ExitProcess

	main ENDP
	END
