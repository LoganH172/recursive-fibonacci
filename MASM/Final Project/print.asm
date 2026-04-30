;print.asm houses the PrintFibonacci function
;PrintFibonacci utilizes Irvine32 library calls to relay output to the console, it also prints the stored array and each value's index to the console.
;PrintFibonacci accepts fibArrayLength as an argument, and uses that value to loop appropriately.
;Documentation of Irvine32 calls can be found at https://csc.csudh.edu/mmccullough/asm/help/

.MODEL flat, stdcall

WriteDec PROTO              ;Passes EAX to console
WriteString PROTO           ;Passes EDX to console
WaitMsg PROTO               ;Provides message before executing next line/closing
Crlf PROTO                  ;Carriage return/line feed acts as a \n or newline character
ReadChar PROTO              ;Reads input from console and stores in AL

.data
EXTERN fibArrayLength:DWORD

fibIndexSep BYTE " | ",0        ;For use with WriteString 
fibIndex DWORD 0                ;For use with WriteDec
infoText1 BYTE "This function presents each Fibonacci number starting from 0 to the highest number a 32-bit unsigned integer can hold.", 0 ;For use with WriteString
infoText2 BYTE "Press any key to continue after each value.",0  ;For use with WriteString
infoText3 BYTE "INDEX | FIBONACCI", 0   ;For use with WriteString

.code
PrintFibonacci PROC
    ;PROLOGUE
    push ebp
    mov ebp, esp

    ;Pushing modified registers
    push eax
    push ecx
    push edx

    ;Passing arguments - since fibArrayLength was restored from previous call, starts at full array length
    mov ecx, [ebp+8]

    ;Setting up printing calls
    mov edx, OFFSET infoText1
    call WriteString    ;EDX to console
    call Crlf           ;Newline
    mov edx, OFFSET infoText2
    call WriteString    ;EDX to console
    call Crlf           ;Newline
    call Crlf           ;Newline
    call ReadChar       ;Wait for response
    mov edx, OFFSET infoText3
    call WriteString    ;EDX to console
    call Crlf           ;Newline
    call ReadChar       ;Wait for response

PRINTLOOP:
   ;Main printing loop
    mov edx, OFFSET fibIndexSep     ;Setting up | in EDX
    mov eax, fibIndex               ;Moving index to EAX
    inc fibIndex                    ;Increase index but does not move until next loop ensuring it is one behind 
    call WriteDec                   ;Write index
    call WriteString                ;Write |
    lodsd                           ;Pass ESI into EAX - since restored from previous call initially points to fibArray[0], then increments to fibArray[1]
    call WriteDec                   ;Write stored Fibonacci number
    call Crlf                       ;Newline
    call ReadChar                   ;Wait for response
    loop PRINTLOOP                  ;Decrement ECX and loop to label until ECX = 0 - since ECX is fibArrayLength this will print the full array
    
    ;Outside loop
    call Crlf       ;Newline                     
    call WaitMsg    ;End message

    ;EPILOGUE
    pop edx 
    pop ecx
    pop eax
    pop ebp
    ret

PrintFibonacci ENDP
END PrintFibonacci