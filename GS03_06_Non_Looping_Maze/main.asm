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

			mov rcx, offset deadEndMessage
			call WriteLine
			jmp complete

		RD:

			RDR:

				mov rcx, offset deadEndMessage
				call WriteLine
				jmp complete


			RDL:

				RDLU:

					mov rcx, offset deadEndMessage
					call WriteLine
					jmp complete


				RDLD:

					RDLDR:

						RDLDRR:

							mov rcx, offset exitMessage
							call WriteLine
							jmp complete


	D:

		DR:

			DRU:

				DRUL:

					mov rcx, offset deadEndMessage
					call WriteLine
					jmp complete


				DRUR:

					mov rcx, offset deadEndMessage
					call WriteLine
					jmp complete


			DRR:

				mov rcx, offset deadEndMessage
				call WriteLine
				jmp complete


		DD:

			DDR:

				DDRR:

					mov rcx, offset exitMessage
					call WriteLine
					jmp complete



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