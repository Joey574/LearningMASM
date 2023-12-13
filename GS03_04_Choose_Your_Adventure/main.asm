.data

userName db 256 dup(0)

outPromtpA db "You awake and find yourself"
			  
outPromtpB db ""
outPromtpC db ""
outPromtpD db ""
		   	  
outPromtpE db ""
outPromtpF db ""
outPromtpG db ""
		   	  
outPromtpH db ""
outPromtpI db ""
outPromtpJ db ""
		   	  
outPromtpK db ""
outPromtpL db ""
outPromtpM db ""

inputPrompt db ""



.code

main PROC

	push rbp
	mov rbp, rsp


	P1:

		P1A:
		jmp complete

		P1B:
		jmp complete

		P1C:
		jmp complete


	P2:

		P2A:
		jmp complete

		P2B:
		jmp complete

		P2C:
		jmp complete

	P3:
		
		P3A:
		jmp complete

		P3B:
		jmp complete

		P3C:
		jmp complete
		

	complete:
	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END