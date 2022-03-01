;Anirudh Sathish 
;Q3
CS20B1125

section .text
    global _start
    
_start:
    
    mov eax,4
    mov ebx,1
    mov ecx,intro
    mov edx,len
    int 80h
    
    mov eax,1
    mov ecx,[initial]
    mov ebx,1
    
    
    
Loop1:
    
    mul ebx
    inc ebx
    loop Loop1
    
    mov esi, factorial               
    call convertToString 
    sub esi, factorial                
    mov [factorialLength], esi

    mov eax, 4
    mov ebx, 1
    mov ecx, factorial
    mov edx, [factorialLength]
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

convertToString:    
    xor ecx, ecx  
    mov ebx, 10
    .Save:                   
    xor edx, edx            
    div ebx                 
    push dx                 
    inc ecx                
    test eax, eax           
    jnz .Save              
.Retrieve:                   
    pop dx                 
    or dl, '0'              
    mov [esi], dl           
    inc esi                
    loop .Retrieve              

    mov byte [esi], 0       
    ret        

section .bss 

factorial resq 36
factorialLength resq 36
num resd 3

section .data

intro db "The Factorial value is : "
len equ $-intro

initial dd 12   