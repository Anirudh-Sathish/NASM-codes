;Anirudh Sathish 
; CS20B1125 
;Assignment1 _Q2


section .data 
  newLineMsg db 0xA
  newLineLen equ $-newLineMsg
  inital : dd 1 
section .bss 
    num resb 1
	res resb 1 
	rem resb 1 
section .text 
   global _start 

_start: 
   
   mov edi , 27 ; We start with a value 27 as R 
   mov esi ,1 ; 
   
l1:
    mov eax , esi 
    mov bl , 10  
    div bl  ; performing division to obtain the digits 
    add al, '0'
    add ah, '0'
	mov [res], al
	mov [rem], ah
	mov eax, 4     ; system call number (sys_write)
	mov ebx, 1     ;file descriptor (stdout)
	mov ecx, res  ; number to print
 	mov edx, 1     ;length
 	int 0x80
 	mov eax, 4     ; system call number (sys_write)
	mov ebx, 1     ;file descriptor (stdout)    
	mov ecx, rem  ; number to print
 	mov edx, 1     ;length
 	int 0x80
 	mov eax , 4
 	mov ebx , 1 
 	mov ecx , newLineMsg  ; to move to the next line
 	mov edx , newLineLen
 	int 0x80
 	
 	inc esi 
 	cmp esi , edi  ; comparing 
 	jle l1 ; looping while condition holds 
 	
 	mov eax,1 ;system call number (sys_exit)
	int 0x80 ;call kernel
