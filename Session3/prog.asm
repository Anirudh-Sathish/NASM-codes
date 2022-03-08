; Anirudh Sathish 
; To print numbers from 1 to 9 , with a line feed 
; using functions from external file 

%include 'Functions.asm'

section .text 
   global _start 

_start: 
    mov ecx , 0 

increNumber:
    inc ecx 
    mov eax , ecx  ; sets the address of the value held in ecx 
    add eax , 48  ; converting to ASCII
    push eax  ; pushing to stack 
    mov eax , esp ; gets the address to the stack 
    call printStringLF 
     
    pop eax 
    cmp ecx , 9 
    jne increNumber

    call exit 
    
 