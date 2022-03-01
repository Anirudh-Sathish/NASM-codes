;Anirudh Sathish 
; This code snippet takes any input number from the user 
; and prints the same when the number is less than 9 

section .data 
   prompt db "Enter the number ", 0xa 
   len equ $-prompt
   anspromp db "The number is ", 0xa 
   len1 equ $-anspromp
   newLine db 0xa
   newLineLen equ $-newLine

section .bss 
   quo resb 1 
   rem resb 1 
   p resb 1 
 
section .text 
  global _start:

_start:

   mov eax ,4 
   mov ebx ,1 
   mov ecx ,prompt
   mov edx ,len
   int 0x80
   
   mov eax ,3 
   mov ebx ,2 
   mov ecx ,p 
   mov edx ,1 
   int 0x80
   
   mov eax ,4
   mov ebx ,1 
   mov ecx ,newLine
   mov edx ,newLineLen
   int 0x80
   
   mov eax,4
   mov ebx ,1 
   mov ecx ,anspromp
   mov edx ,len1
   int 0x80
   
   mov eax ,4 
   mov ebx ,1 
   mov ecx ,p
   mov edx ,1
   int 0x80

   mov eax ,4
   mov ebx ,1 
   mov ecx ,newLine
   mov edx ,newLineLen
   int 0x80
   
   mov eax ,1 
   mov ebx ,0 
   int 0x80