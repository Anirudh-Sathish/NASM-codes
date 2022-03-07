; Anirudh Sathish 
; Code to print a message 
; where we have written a function to code the length of the string 


section .data
   msg db "I am printing out a message", 0xa

section .text
   global start_
start_:
    mov eax, msg ; eax contains the address of the message 
    call findLen
    mov edx , eax 
    mov ecx , msg 
    mov ebx , 1 
    mov eax , 4 
    int 80h

    mov eax , 1 
    mov ebx , 0 
    int 80h

findLen: 
    push ebx ; preserves value of ebx 
    mov ebx , eax  ; ebx also points to the same address as eax 

moveNext:  ; refer to the test code snippet 
    cmp byte[eax] , 0 
    jz end 
    inc eax 
    jmp moveNext

end:
    sub eax , ebx 
    pop ebx 
    ret  


    



