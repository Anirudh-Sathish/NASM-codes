; We will print a specific message 
; Here , we shall write a snippet to find the length 
; rather than the usual approach 

section .data 
   msg db "Glad to test ",0xa

section .text 
    global start_
_start: 
    mov eax , msg ; eax will point to the address of the message 
    mov ebx , eax ; ebx will also point to the same adress as eax 

readNext:
    cmp byte[eax],0 ; we will check if the string is to end on the basis 
                    ; of the zero delimiter  
    jz end          ; jump if zero flag is found 
    inc eax         ; eax moves on 
    jmp readNext    ; repeat 

end:
    sub eax , ebx  ; This will give length of the string 

    mov edx , eax 
    mov ecx , msg 
    mov ebx , 1 
    mov eax , 4
    int 0x80

    mov eax , 1 
    mov ebx , 0 
    int 0x80
     

