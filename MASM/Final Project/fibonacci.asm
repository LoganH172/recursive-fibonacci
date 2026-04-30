.MODEL flat,stdcall

.data
EXTERN fibArg1:DWORD
EXTERN fibArg2:DWORD
EXTERN fibArrayLength:DWORD

.code
Fibonacci PROC
    push ebp
    mov ebp, esp

    push eax
    push ecx
    push edx

    mov ecx, [ebp+16]
    mov edx, [ebp+12]
    mov eax, [ebp+8]

    cmp ecx, 0          
    je DONE
    
    cmp esi, ebx
    je BASE
    jmp SEQUENCE

SEQUENCE:           
    add eax, edx
    mov [esi], eax
    
    
    mov edx, [esi-4]
    mov fibArg1, edx
    mov fibArg2, eax
    add esi, 4

    dec ecx
    mov fibArrayLength, ecx

    push esi
    push fibArrayLength
    push fibArg2
    push fibArg1
    call Fibonacci
    add esp, 8
    pop fibArrayLength
    pop esi


DONE:
    pop edx
    pop ecx
    pop eax
    pop ebp
    ret
    
BASE:
    mov [esi], eax
    add esi, 4
    dec ecx
    mov [esi], edx
    add esi, 4
    dec ecx
    jmp SEQUENCE
    
Fibonacci ENDP
END Fibonacci