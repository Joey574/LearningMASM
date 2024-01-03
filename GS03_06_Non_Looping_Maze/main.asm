Extern WriteLine: proc

.data

errorMessage db "Error with user input, value provided not expected, program exiting",0
exitMessage db "Congratulations! You have made it to the exit!",0
deadEndMessage db "Sorry! You've reached a dead end.",0

.code

main PROC

	push rbp
	mov rbp, rsp

	R:

		RR:

		RD:

			RDR:

			RDL:

				RDLU:

				RDLD:

					RDLDR:

						RDLDRR:

	D:

		DR:

			DRU:

				DRUL:

				DRUR:

			DRR:

		DD:

			DDR:

				DDRR:


	deadEnd:
	mov rcx, offset deadEndMessage
	call WriteLine
	jmp complete

	exit:
	mov rcx, offset exitMessage
	call WriteLine
	jmp complete

	error:
	mov rcx, offset errorMessage
	call WriteLine
	jmp complete

	complete:

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END