.data

; ===== DECLARATION ======>

t8 DB 0FFh ; Max value for a signed byte in hexadecimal
; When declaring a value in hexadecimal it must end with an h
; It also must start with a 0 if the first value is a letter such as in the example above
; It is common practice to put a 0 in front of all hex values even if not starting with a letter

t9 DB ? ; If you want to declare a value without initializing you can do so with a '?'

t10 DB "This is a string" ; If quotes are put around a string the assembler will recognize it as such
; The assembler will convert the string into the byte values of whatever convention is being used
; In this case, the encoding method used is ASCII I believe

; <===== DECLARATION ======


.code

main PROC


	ret

	main ENDP
	END