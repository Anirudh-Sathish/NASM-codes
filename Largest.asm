;Anirudh Sathish
;Program to find the largest of 5 given numbers 
section .text
 global _start ;must be declared for using gcc
_start: ;tell linker entry point
	mov ecx, [num1]
 	cmp ecx, [num2]
 	jg check_third_num
	 mov ecx, [num2]
	cmp ecx,[num3]
	jg _mid
	mov ecx,[num3]
	jmp _mid
   check_third_num:
 	cmp ecx, [num3]
	jg _mid
	 mov ecx, [num3]

_mid :
   cmp ecx , [num4]
   jg check_fifth_num 
   mov ecx , [num4]
   cmp ecx , [num5]
   jg _exit 
   mov ecx ,[num5]
   jmp _exit
   check_fifth_num:
   cmp ecx , [num5]
   jg _exit 
   mov ecx , [num5]

 _exit:
 	 mov [largest], ecx
 	mov ecx,msg
 	mov edx, len
 	mov ebx,1 ;file descriptor (stdout)
	 mov eax,4 ;system call number (sys_write)
	 int 0x80 ;call kernel
 
	 mov ecx,largest
	 mov edx, 4
	 mov ebx,1 ;file descriptor (stdout)
 	mov eax,4 ;system call number (sys_write)
 	int 0x80 ;call kernel
 
	 mov eax, 1
	 int 80h
section .data
 	msg db "The largest digit is: ", 0xA,0xD
	 len equ $- msg 
 	num1 dd '411'
 	num2 dd '421'
 	num3 dd '431'
 	num4 dd '451'
 	num5 dd '441'
segment .bss
 	largest resq 8
