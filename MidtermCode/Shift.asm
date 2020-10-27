;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name:                                                                <==========================put program name here
;  Programming languages:                                                       <==========================put file types and quanties here
;  Date of last update:                                                         <==========================put date here
;  Files in this program: sxavexrstordriver.cpp, xsavexrstor.asm, run.sh
;  Status: This program was tested by the author many times.
;  Purpose: The purpsoe of this program is to call xsavexrstormain
;
;This file
;  Name: NAME.asm                                                               <==========================put file name here
;  Language: X86                                                                <==========================put file type here
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l circlemain.lis -o circlemain.o circlemain.asm
;  Purpose: Compute the approximate circumference of a cricle using only integers
;
;
;===== Begin code area ======================================================================================================
global Shift
extern printf
extern scanf                                     ;External C++ function for writing to standard output device





segment .data                                     ;Place initialized data here

welcomemessage1 db "The values in the array have been shifted",10,0


integerformat db "%ld", 0                         ;general decimal integer
stringformat db "%s", 0                           ;general string format

segment .bss                                      ;Place un-initialized data here.

segment .text                                     ;Place executable instructions in this segment.
Shift:
							              ;Entry point.  Execution begins here.
push       rbp                                    ;Save a copy of the stack base pointer
mov        rbp, rsp                               ;We do this in order to be 100% compatible with C and C++.
push       rbx                                    ;Back up rbx
push       rcx                                    ;Back up rcx
push       rdx                                    ;Back up rdx
push       r8                                     ;Back up r8
push       r9                                     ;Back up r9
push       r10                                    ;Back up r10
push       r11                                    ;Back up r11
push       r12                                    ;Back up r12
push       r13                                    ;Back up r13
push       r14                                    ;Back up r14
push       r15                                    ;Back up r15
pushf                                             ;Back up rflags


;========================================================         CODE         ===========================================================


mov r14,rdi              ;array
mov r15,rsi              ;size

Mov r12,r15     ; holds the current count -1
;dec r12

Mov r13,r15     ; holds the current count
inc r13
jmp start



Loop:                               ; next in loop
dec r13                                           
dec r12

start:
cmp r12, -1                                    ;compare if currentpos = size
je complete                                    ; if equal size then complete

mov r10, [r14 + 8 * r12]
mov  [r14 + 8 * r13], r10                  ;moves previous array[i] into array[i+1]



jmp Loop
complete:

mov r10, -1
mov [r14], r10





;=============================================== print output=============================


mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, stringformat
mov        rsi, welcomemessage1
call       printf




mov rax, 0                               

mov rdi, r14                                ;send back arr and size
mov rsi, r15


;=========== Now cleanup and return to the caller =========================================================================


popf                                              ;Restore rflags
pop        r15                                    ;Restore r15
pop        r14                                    ;Restore r14
pop        r13                                    ;Restore r13
pop        r12                                    ;Restore r12
pop        r11                                    ;Restore r11
pop        r10                                    ;Restore r10
pop        r9                                     ;Restore r9
pop        r8                                     ;Restore r8
pop        rdx                                    ;Restore rdx
pop        rcx                                    ;Restore rcx
pop        rbx                                    ;Restore rbx
pop        rbp                                    ;Restore rbp


ret
;====== The End ===========================================================================================================



