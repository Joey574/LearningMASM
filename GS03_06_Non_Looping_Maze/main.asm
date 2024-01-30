Extern WriteLine: proc
Extern ReadLine: proc
Extern Write: proc

.data

errorMessage db "Error with user input, value provided not expected, program exiting",0
exitMessage db "Congratulations! You have made it to the exit!",0
deadEndMessage db "Sorry! You've reached a dead end.",0

m1 db "1) Right",13,10,"2) Down",0
m2 db "1) Left",13,10,"2) Right",0
m3 db "1) Up",13,10,"2) Down",0
m4 db "1) Right",0
m5 db "1) Up",13,10,"2) Right",0

inputMessage db "Input (1-4): ",0

.code

main PROC

	push rbp
	mov rbp, rsp


	mov rcx, offset m1
	call WriteLine
	mov rcx, offset inputMessage
	call Write

	call ReadLine

	cmp byte ptr [rax], "1"
	je R
	cmp byte ptr [rax], "2"
	je D
	jmp error

	R:

		mov rcx, offset m1
		call WriteLine
		mov rcx, offset inputMessage
		call Write

		call ReadLine

		cmp byte ptr [rax], "1"
		je RR
		cmp byte ptr [rax], "2"
		je RD
		jmp error

		RR:

			mov rcx, offset deadEndMessage
			call WriteLine
			jmp complete

		RD:

			mov rcx, offset m2
			call WriteLine
			mov rcx, offset inputMessage
			call Write

			call ReadLine

			cmp byte ptr [rax], "1"
			je RDL
			cmp byte ptr [rax], "2"
			je RDR
			jmp error

			RDR:

				mov rcx, offset deadEndMessage
				call WriteLine
				jmp complete


			RDL:

				mov rcx, offset m3
				call WriteLine
				mov rcx, offset inputMessage
				call Write

				call ReadLine

				cmp byte ptr [rax], "1"
				je RDLU
				cmp byte ptr [rax], "2"
				je RDLD
				jmp error

				RDLU:

					mov rcx, offset deadEndMessage
					call WriteLine
					jmp complete


				RDLD:

					mov rcx, offset m4
					call WriteLine
					mov rcx, offset inputMessage
					call Write

					call ReadLine

					cmp byte ptr [rax], "1"
					je RDLDR
					jmp error

					RDLDR:

						mov rcx, offset m4
						call WriteLine
						mov rcx, offset inputMessage
						call Write

						call ReadLine

						cmp byte ptr [rax], "1"
						je RDLDRR
						jmp error

						RDLDRR:

							mov rcx, offset exitMessage
							call WriteLine
							jmp complete


	D:

		mov rcx, offset m1
		call WriteLine
		mov rcx, offset inputMessage
		call Write

		call ReadLine

		cmp byte ptr [rax], "1"
		je DR
		cmp byte ptr [rax], "2"
		je DDa
		jmp error

		DR:

			mov rcx, offset m5
			call WriteLine
			mov rcx, offset inputMessage
			call Write

			call ReadLine

			cmp byte ptr [rax], "1"
			je DRU
			cmp byte ptr [rax], "2"
			je DRR
			jmp error

			DRU:

				mov rcx, offset m2
				call WriteLine
				mov rcx, offset inputMessage
				call Write

				call ReadLine

				cmp byte ptr [rax], "1"
				je DRUL
				cmp byte ptr [rax], "2"
				je DRUR
				jmp error

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


		DDa:

			mov rcx, offset m4
			call WriteLine
			mov rcx, offset inputMessage
			call Write

			call ReadLine

			cmp byte ptr [rax], "1"
			je DDR
			jmp error

			DDR:

				mov rcx, offset m4
				call WriteLine
				mov rcx, offset inputMessage
				call Write

				call ReadLine

				cmp byte ptr [rax], "1"
				je DDRR
				jmp error

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