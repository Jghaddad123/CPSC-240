;This is a library function distributed without accompanying software.                                                      *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public   *
;License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be   *
;useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.*
;See the GNU General Public License for more details.  A copy of the GNU Lesser General Public License 3.0 should have been *
;distributed with this function.  If the LGPL does not accompany this software then it is available here:                    *
;<https:;www.gnu.org/licenses/>.  
;
;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: Array Sum
;  Programming languages: 2 modules in C++, 3 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-Sep-29
;  Date of last update: 2020-Oct-5
;  Status: This program was tested by the author many times.
;
;This file
;  Name: Manager.asm
;  Language: X86
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm
;  Purpose: Manage the process of finding sum of an array given by the user
;
;
;===== Begin code area =======================================================================================
extern Shift
extern printf
extern scanf                                     ;External C++ function for writing to standard output device
extern Input_Array
extern Display_Array
global manager                                    ;This makes Manage callable by functions outside of this file.

segment .data                                    ;Place initialized data here

welcomemessage2 db "Enter a sequence of long integers separated by white space.",10,0
welcomemessage3 db "After the last input press enter followed by Control+D", 10, 0
goodbye6        db "The last value will now be returned to driver.", 10, 0

integerformat db "%ld", 0                         ;general decimal integer
stringformat db "%s", 0                           ;general string format

segment .bss                                      ;Place un-initialized data here.
arr: resq 100

segment .text                                     ;Place executable instructions in this segment.
manager:							                  ;Entry point.  Execution begins here.

;=========== Back up all the integer registers used in this program ==========================================
;Omitted from back up are rax, rip.
push       rbp                                    ;Save a copy of the stack base pointer
mov        rbp, rsp                               ;We do this in order to be 100% compatible with C and C++.
push       rbx                                    ;Back up rbx
push       rcx                                    ;Back up rcx
push       rdx                                    ;Back up rdx
push       rsi                                    ;Back up rsi
push       rdi                                    ;Back up rdi
push       r8                                     ;Back up r8
push       r9                                     ;Back up r9
push       r10                                    ;Back up r10
push       r11                                    ;Back up r11
push       r12                                    ;Back up r12
push       r13                                    ;Back up r13
push       r14                                    ;Back up r14
push       r15                                    ;Back up r15
pushf                                             ;Back up rflags

;=========== Show the welcome message =========================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, stringformat
mov        rsi, welcomemessage2
call       printf                                 ;Display the message using library function

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, stringformat
mov        rsi, welcomemessage3
call       printf                                 ;Display the message using library function

;=========== take in user input and verify array =================================================================
mov rax, 0
mov rdi, arr
mov rsi, 100                                        ;size of array
call        Input_Array      ;rax now holds values
mov       r15,rax
;===========print back array =====================================================================================
mov rax, 0
mov rdi, arr
mov rsi, r15
call Display_Array

;===========call shift ==============================================================================

											;WORKING TO HERE 
mov        rax, 0
mov	   rdi, arr
mov        rsi, r15 
call Shift
;mov arr, rdi
mov r15, rsi             
                                          
;===========print back array =====================================================================================
mov rax, 0
mov rdi, arr
mov rsi, r15
call Display_Array

; ================================= print goodbye message =====================================
mov qword  rax,0
mov        rdi, stringformat
mov        rsi, goodbye6
call       printf                                 ;Display the message using library function


;============================ move last val in array to rax         NEED TO DO
dec r15
mov        rax, [arr + 8 * r15]
;=========== restore all the integer registers used in this program =======================================================


popf                                              ;Restore rflags
pop        r15                                    ;Restore r15
pop        r14                                    ;Restore r14
pop        r13                                    ;Restore r13
pop        r12                                    ;Restore r12
pop        r11                                    ;Restore r11
pop        r10                                    ;Restore r10
pop        r9                                     ;Restore r9
pop        r8                                     ;Restore r8
pop        rdi                                    ;Restore rdi
pop        rsi                                    ;Restore rsi
pop        rdx                                    ;Restore rdx
pop        rcx                                    ;Restore rcx
pop        rbx                                    ;Restore rbx
pop        rbp                                    ;Restore rbp


ret
;====== The End ===========================================================================================================
