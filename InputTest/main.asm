extern ReadLine: proc

.data

.code

main PROC

	push rbp
	mov rbp, rsp

	call ReadLine
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END