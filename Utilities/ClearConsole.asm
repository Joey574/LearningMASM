.data

	; Parameters for FillConsoleOutputCharacter
	bufferSize:COORD ?
	bufferCoord:COORD ?
	numCharsWritten:DWORD ?

.code

main PROC

	push rbp
	mov rbp, rsp

	

	; Set buffer size to cover the entire console screen
	mov bufferSize.X, 80
	mov bufferSize.Y, 25

	; Set buffer coordinate to the top-left corner of the console screen
	mov bufferCoord.X, 0
	mov bufferCoord.Y, 0

	; Fill the console screen with spaces
	invoke FillConsoleOutputCharacter, consoleHandle, ' ', bufferSize.X * bufferSize.Y, bufferCoord, ADDR numCharsWritten

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END