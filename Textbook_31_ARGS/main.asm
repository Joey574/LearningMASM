ExitProcess PROTO

.data

	arr qword 100, 150, 250

.code

sum PROC
	xor rax, rax
	start:
	add rax, [ rdx ]
	add rdx, 8
	dec rcx
	jnz start
	ret
sum ENDP

main PROC

	mov rcx, lengthof arr
	lea rdx, arr

	call sum

	call ExitProcess

	main ENDP
	END