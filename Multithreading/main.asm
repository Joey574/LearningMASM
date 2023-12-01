extern CreateThread: proc
extern WaitForSingleObject: proc
extern CloseHandle: proc
extern GetExitCodeThread: proc

extern ThreadFunction1: proc

.data
    ThreadHandle1   dq ?
    ExitCode1       dw ?
    
.code

main PROC

	push rbp
	mov rbp, rsp
    sub rsp, 32

    ; Create the first thread
    mov     rcx, offset ThreadFunction1
    mov     rdx, 0                 ; lpParameter (not used in this example)
    mov     r8, 0                  ; dwCreationFlags (0 for immediate thread execution)
    mov     r9, 0                  ; lpThreadId (output parameter, not used in this example)
    call    CreateThread

    ; Save the thread handle
    mov     ThreadHandle1, rax

    ; Wait for threads to finish
    mov     rcx, ThreadHandle1
    call    WaitForSingleObject

    ; Retrieve exit codes if needed
    mov     rcx, ThreadHandle1
    mov     rdx, offset ExitCode1
    call    GetExitCodeThread

    ; Clean up resources
    mov     rcx, ThreadHandle1
    call    CloseHandle

    ; Your main program continues here

    ; Exit the program
    mov     eax, 0
    ret

    add rsp, 32
	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END