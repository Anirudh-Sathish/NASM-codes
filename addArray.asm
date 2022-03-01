;Anirudh Sathish 
;CS20B1125
;Question 4

section .bss
    SumLength resd 2
    TotalSum resq 36                 
    
              
section .data
	global array
    len db 9
    newLineMsg db 0xA
    newLineLen equ $-newLineMsg
    msg db "The summation of the array is  : "
	msglen equ $ - msg
    
array:				
	dd 23
	dd 67
	dd 12
	dd 33
	dd 49
	dd 19
	dd 33
	dd 15
	dd 92
	dd 77
section .text
    global _start
_start:
	mov   eax,4
	mov   ebx,1
	mov   ecx, msg
 	mov   edx, msglen
	int   80h
	
	mov esi, 10	
	xor eax, eax	

Summation:
	mov ebx,DWORD [array+esi*4-4] 
	add eax, ebx	
	dec esi			
	test esi, esi
	jnz Summation		

    mov edi, TotalSum               
    call ConvertToString               
    sub edi, TotalSum                
    mov [SumLength], edi
    
    mov eax, 4
    mov ebx, 1
    mov ecx, TotalSum 
    mov edx, [SumLength]
    int 80h  
     
    mov eax, 4
    mov ebx, 1
    mov ecx, newLineMsg
    mov edx, newLineLen
    int 80h

	mov eax, 1
	mov ebx, 0
	int 80h

ConvertToString:
    xor ecx, ecx
    mov ebx, 10
Save:                   
    xor edx, edx            
    div ebx                 
    push dx                 
    add ecx , 1              
    test eax, eax           
    jnz Save                
Retrieve:                   
    pop dx                  
    or dl, '0'              
    mov [edi], dl          
    add edi , 1            
    loop Retrieve               

    mov byte [edi], 0       
    ret   
    