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

	
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END