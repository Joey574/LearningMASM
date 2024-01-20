ExitProcess PROTO

.data

.code

max PROC
	mov rcx, [rsp+16]
	mov rdx, [rsp+8]
	cmp rcx, rdx
	jg large
	mov rax, rdx
	jmp finish
	large:
	mov rax, rcx
	finish:
	ret
max ENDP

main PROC

	xor rax, rax
	push 100
	push 500

	call max

	add rsp, 16

	call ExitProcess

	main ENDP
	END