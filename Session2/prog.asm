; Anirudh Sathish 
; Over here we will include an external file 

%include  'Functions.asm'

section .data 
   msg1 db "This helps in code recycling",0xa,0h
   msg2 db "Reporting for duty",0xa,0h
   msg3 db "Further Testing",0xa,0h

section .text 
   global _start
_start:
    mov eax,msg1 
    call printString 

    mov eax,msg2 
    call printString

    mov eax, msg3
    call printString
    
    call exit       