;fibonacci.asm holds the Fibonacci function. It accepts 4 arguments (fibArg1, fibArg2, fibArrayLength, fibArray)
;fibArg1 and fibArg2 will be modified and stored into fibArray
;fibArrayLength ensures ESI does not exceed bounds of array
;EXTERN is used for variabled declared in main.asm

.MODEL flat,stdcall

.data
EXTERN fibArg1:DWORD
EXTERN fibArg2:DWORD
EXTERN fibArrayLength:DWORD

.code
Fibonacci PROC
    ;PROLOGUE
    push ebp
    mov ebp, esp

    ;Pushing registers that will be modified
    push eax    
    push ecx
    push edx

    ;Assigning arguments 
    mov ecx, [ebp+16]   ;fibArrayLength
    mov edx, [ebp+12]   ;fibArg2
    mov eax, [ebp+8]    ;fibArg1

    ;Compare ECX (fibArrayLength) to 0 
    cmp ecx, 0          
    je DONE     ;If true function call is done
    
    cmp esi, ebx    ;Check if ESI = EBX (fibArray[0])
    je BASE         ;If true assign base cases
    jmp SEQUENCE    ;Redundant jump to ensure code is properly executed

SEQUENCE:
    ;Comments all breakdown first execution 
    add eax, edx        ;fibArg2 + fibArg1 = EAX
    mov [esi], eax      ;Move EAX to fibArray[2]
    
    
    mov edx, [esi-4]    ;Move the value at fibArray[1] to EDX
    mov fibArg1, edx    ;Assign fibArg1 the value stored in EDX (1)
    mov fibArg2, eax    ;Assign fibArg2 the value stored in EAX (1)
    add esi, 4          ;Next position (fibArray[3])

    dec ecx             ;Decrement the counter
    mov fibArrayLength, ecx ;Move ECX to fibArrayLength to ensure proper passing

    push esi                ;Passing as argument for recursive call
    push fibArrayLength     ;Passing as argument for recursive call
    push fibArg2            ;Passing as argument for recursive call
    push fibArg1            ;Passing as argument for recursive call 
    call Fibonacci          ;Recursive call - code below executes after epilogue
    add esp, 8              ;Cleaning fibArg1 and fibArg2 from stack
    pop fibArrayLength      ;Restoring for future use 
    pop esi                 ;Restoring for future use


DONE:
    ;EPILOGUE
    ;Each call executes to clean base pointers and registers, then returns to clean arguments
    pop edx
    pop ecx
    pop eax
    pop ebp
    ret
    
BASE:
    mov [esi], eax  ;Move fibArg1 (0) to fibArray[0]
    add esi, 4      ;Move to next poistion (DWORD are 4 bytes)
    dec ecx         ;Decrement the counter since a position is filled
    mov [esi], edx  ;Move fibArg2 (1) to fibArray[1]
    add esi, 4      ;Move to next position
    dec ecx         ;Decrement the counter since a position is filled 
    jmp SEQUENCE    ;Jump to main sequence 
    
Fibonacci ENDP
END Fibonacci