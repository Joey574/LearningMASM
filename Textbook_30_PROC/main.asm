ExitProcess PROTO

.data

.code

zeroRAX PROC
xor rax, rax
ret
zeroRAX ENDP

main PROC

	mov rax, 8
	call zeroRAX

	call ExitProcess

	main ENDP
	END