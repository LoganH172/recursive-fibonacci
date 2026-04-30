.MODEL flat, stdcall

WriteDec PROTO
WriteString PROTO
WaitMsg PROTO
Crlf PROTO
ReadChar PROTO

.data
EXTERN fibArrayLength:DWORD

fibIndexSep BYTE " | ",0
fibIndex DWORD 0
infoText1 BYTE "This function presents each Fibonacci number starting from 0 to the highest number a 32-bit unsigned integer can hold.", 0
infoText2 BYTE "Press any key to continue after each value.",0
infoText3 BYTE "INDEX | FIBONACCI", 0

.code
PrintFibonacci PROC
    push ebp
    mov ebp, esp
    push eax
    push ecx
    push edx

    mov ecx, [ebp+8]

    mov edx, OFFSET infoText1
    call WriteString
    call Crlf
    mov edx, OFFSET infoText2
    call WriteString
    call Crlf
    call Crlf
    call ReadChar
    mov edx, OFFSET infoText3
    call WriteString
    call Crlf
    call ReadChar

PRINTLOOP:
   
    mov edx, OFFSET fibIndexSep
    mov eax, fibIndex
    inc fibIndex
    call WriteDec
    call WriteString
    lodsd
    call WriteDec
    call Crlf
    call ReadChar
    loop PRINTLOOP
    

    call Crlf
    call WaitMsg
    pop edx 
    pop ecx
    pop eax
    pop ebp
    ret

PrintFibonacci ENDP
END PrintFibonacci