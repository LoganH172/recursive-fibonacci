;Main is the entry point for the entire project. It serves to set up crucial global details, such as variables used in other functions and the Irvine32 library.
;Main also sets the intial "pointers" to the array used for storing the fibonacci sequence. Main also serves as the primary caller of any function, and serves as the final
;terminating point of the project. 

;PUBLIC is used to declare variables that will use the EXTERN keyword to access the same global variable
;PROTO is used to define functions in other files
;Irvine32 library is used for printing functionality. Please see README for additional details. 

.386
.MODEL flat, stdcall
.STACK 4096

ExitProcess PROTO, dwExitCode:DWORD
Fibonacci PROTO
PrintFibonacci PROTO


INCLUDELIB Irvine32.lib

.data

PUBLIC fibArg1  
PUBLIC fibArg2
PUBLIC fibArrayLength

fibArg1 DWORD 0				;Initial value
fibArg2 DWORD 1			    ;Initial value 
fibArrayLength DWORD 48 	;Length of desired printed digits, will be used to track how many times to call, CANNOT EXCEED 48

fibArray DWORD 48 DUP(?)	;Starting array CANNOT EXCEED 48 IN LENGTH

.code
main PROC
	mov ebx, OFFSET fibArray	;Provide OFFSET to address of array
	mov esi, ebx				;Move base address to source index

	push esi					;Argument of fibArray/fibIndex in C#. Acts as pointer to array and modifies values at each index
	push fibArrayLength			;Argument. Acts as counter to ensure ESI does not exceed array
	push fibArg2				;Argument. Will be modified in function
	push fibArg1				;Argument. Will be modified in function 
	call Fibonacci				;Function call
	add esp, 8					;Clean fibArg1 & fibArg2 from stack
	pop fibArrayLength			;Pop fibArrayLength for future use
	pop esi						;Pop ESI for future use

	push fibArrayLength			;Argument
	call PrintFibonacci			;Function call
	add esp, 4					;Clean stack

	INVOKE ExitProcess, 0		;Exit
main ENDP
END main