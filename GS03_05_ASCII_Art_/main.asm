Extern WriteLine: proc
Extern Write: proc
Extern ReadLine: proc

.data

ASCII1 db "      _",13,10,"     |-|  __",13,10,"jgs  |=| [Ll]",13,10,"     ",34,"^",34," ====`o",0
ASCII2 db "        _______",13,10,"        |.-----.|",13,10,"        ||x . x||",13,10,"        ||_.-._||",13,10,"        `--)-(--`",13,10,"       __[=== o]___",13,10,"      |:::::::::::|\",13,10,"jgs   `-=========-`()",0
ASCII3a db "                              \\\\\\\",13,10,"                            \\\\\\\\\\\\",13,10,"                          \\\\\\\\\\\\\\\",13,10,"  -----------,-|           |C>   // )\\\\|",13,10,"           ,','|          /    || ,'/////|",13,10,"---------,','  |         (,    ||   /////",13,10,"         ||    |          \\  ||||//''''|",13,10,"         ||    |           |||||||     _|",13,10,"         ||    |______      `````\____/ \",0
ASCII3b db "         ||    |     ,|         _/_____/ \",13,10,"         ||  ,'    ,' |        /          |",13,10,"         ||,'    ,'   |       |         \  |",13,10,"_________|/    ,'     |      /           | |",13,10,"_____________,'      ,',_____|      |    | |",13,10,"             |     ,','      |      |    | |",0
ASCII3c db "             |   ,','    ____|_____/    /  |",13,10,"             | ,','  __/ |             /   |",13,10,"_____________|','   ///_/-------------/   |",13,10,"              |===========,'",0

InputPrompt db "1) Computer 1",13,10, "2) Computer 2",13,10,"3) Computer and Coder",13,10,"Input: ",0

.code

main PROC

	push rbp
	mov rbp, rsp

	start:
	mov rcx, offset InputPrompt
	call Write

	call ReadLine

	cmp byte ptr [rax], "1"
	je firstASCII
	cmp byte ptr [rax], "2"
	je secondASCII
	cmp byte ptr [rax], "3"
	je thirdASCII
	jmp complete

	firstASCII:

	mov rcx, offset ASCII1
	call WriteLine

	jmp start
	secondASCII:

	mov rcx, offset ASCII2
	call WriteLine

	jmp start
	thirdASCII:

	mov rcx, offset ASCII3a
	call WriteLine
	mov rcx, offset ASCII3b
	call WriteLine
	mov rcx, offset ASCII3c
	call WriteLine

	jmp start
	complete:

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END