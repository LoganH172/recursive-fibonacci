;Main is the entry point for the entire project. It serves to set up crucial global details, such as variables used in other functions and the Irvine32 library.
;Main also sets the intial "pointers" to the array used for storing the fibonacci sequence. Main also serves as the primary caller of any function, and serves as the final
;terminating point of the project. 

.386
.MODEL flat, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD
Fibonacci PROTO
PrintFibonacci PROTO


INCLUDELIB Irvine32.lib
;ANNOTATE CODE CORRECTLY & CREATE README LINKING TO HOW TO USE IRVINE32. ALSO MENTION POINTING MAIN AS ENTRY POINT AND SAFESEHANDLE
.data

PUBLIC fibArg1
PUBLIC fibArg2
PUBLIC fibArrayLength

fibArg1 DWORD 0
fibArg2 DWORD 1
fibArrayLength DWORD 48

fibArray DWORD 48 DUP(?)

.code
main PROC
	mov ebx, OFFSET fibArray
	mov esi, ebx       

	push esi
	push fibArrayLength
	push fibArg2
	push fibArg1
	call Fibonacci
	add esp, 8
	pop fibArrayLength
	pop esi

	push fibArrayLength
	call PrintFibonacci
	add esp, 4

	INVOKE ExitProcess, 0 
main ENDP
END main