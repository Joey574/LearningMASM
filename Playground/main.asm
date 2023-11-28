extern GetStdHandle: proc
extern WriteFile: proc
extern WriteLine: proc

.data

.code

main PROC

	call WriteLine

	ret

	main ENDP
	END