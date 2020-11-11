;
;
;
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
;  Assemble: nasm -f elf64 -l area.lis -o area.o area.asm
;  Purpose: Compute the approximate circumference of a cricle using only integers
;
;
;===== Begin code area ======================================================================================================

extern printf
extern scanf                                     ;External C++ function for writing to standard output device
extern atof
extern isfloat
global area

segment .data                                     ;Place initialized data here

inputmessage db "Enter the floating point lengths of the 3 sides of your triangle: ",10, 0                        
errormessage db "Invalid Float Restarting Program", 10, 0                        
confermmessage db "These values were recieved: %lf %lf %lf", 10, 0                        
areamessage db "The Area of this triangle is %lf square meters", 10, 0                        
exitmessage db "Now 0 will be returned to the operating system. Bye", 10,0

integerformat db "%ld", 0                         ;general decimal integer
stringformat db "%s", 0                           ;general string format
floatformat db "%lf", 0                           ;general float format

segment .bss                                      ;Place un-initialized data here.
segment .text                                     ;Place executable instructions in this segment.

area:							              ;Entry point.  Execution begins here.


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


;========================================================         CODE         ===========================================================
mov rax, 0
mov rdi, inputmessage           ; input greeting     
call printf



sub rsp, 64                     ;subtract here so it only subracts once in entire program
jmp Begin


;========================================================         Error         ===========================================================

Error:
mov rax, 0
mov rdi, errormessage           ; restarting     
call printf
jmp Begin


;========================================================       Scan in       ===========================================================

Begin:
mov rax, 0
mov rdi, stringformat      ;doing string to verify before float
mov rsi, rsp
call scanf


;========================================================       check validity       ===========================================================
mov rdi, rsp
mov rax, 1 
call isfloat



mov r15, 0 
cmp rax, r15      ;checking if rax 0 or 1 if 0 error else valid
je Error
;========================================================       convert to float       ===========================================================

mov rax, 1
mov rdi,rsi
call atof
movsd xmm15, xmm0          
add rsp, 64




;=========== Now cleanup and return to the caller =========================================================================

mov rax, r15                               ;Send the integer circumference to main

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





