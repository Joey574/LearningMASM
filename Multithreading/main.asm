
.data
    msgMain db "Main thread is running", 0
    msgThread db "Thread is running", 0

.data?
    hThread HANDLE ?

.code

main PROC

	push rbp
	mov rbp, rsp

	; Output main thread message
    invoke  MessageBox, NULL, addr msgMain, NULL, MB_OK

    ; Create a new thread
    invoke  CreateThread, NULL, 0, ADDR ThreadProc, NULL, 0, ADDR hThread

    ; Wait for the thread to finish (optional)
    invoke  WaitForSingleObject, hThread, INFINITE
    
    ; Output message after the thread completes
    invoke  MessageBox, NULL, addr msgMain, NULL, MB_OK

    ; Close the thread handle
    invoke  CloseHandle, hThread

	mov rsp,rbp
    pop rbp

	ret

	main ENDP
	END