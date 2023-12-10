.data

final db 256 dup (0)

.code

FlipArray PROC

	push rbp
	mov rbp, rsp

	xor r10, r10 ; store length

	dec rcx ; offset for first inc

	lengthLoop:
		inc r10
		inc rcx
		cmp byte ptr [rcx], 0
		jg lengthLoop

	mov rax, offset final
	dec rcx ; offset for copy
	dec r10 ; offset for copy

	copyLoop:
		mov r11b, [rcx]
		mov [rax], r11b
		inc rax
		dec rcx
		dec r10
		cmp r10, 0
		jg copyLoop
		
	mov rax, offset final

	mov rsp,rbp
    pop rbp

	ret

	FlipArray ENDP
	END