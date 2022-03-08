; Anirudh Sathish 
; These are a list of functions 
; Helps in recycling codes 


; To find length of the string 
StringLength:
    push ebx 
    mov ebx,eax 
moveNext:
    cmp byte [eax],0
    jz end 
    inc eax 
    jmp moveNext
end:
   sub eax,ebx 
   pop ebx 
   ret 

printString : 
    push edx   ; Save all the prior values 
    push ecx 
    push ebx 
    push eax 
    call StringLength 

    mov edx ,eax 
    pop eax 

    mov ecx , eax 
    mov ebx , 1 
    mov eax , 4 
    int 0x80 

    pop ebx 
    pop ecx 
    pop edx 
    ret

; PrintingString with a line feed 
printStringLF : 
    call printString ; prints first part 

    push eax 
    mov eax , 0ah ; for line feed 
    push eax 
    mov eax , esp 
    call printString
    pop eax 
    pop eax 
    ret 


; Code to exit 
exit:
    mov eax , 1 
    mov ebx , 0 
    int 0x80
    ret