
;
;
;
;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: Assignment1-240-Circumference
;  Programming languages: One modules in C++, one module in X86-64, and one module in Bash.
;  Date program began: 2020-Sep-16
;  Date of last update: 2020-Sep-16
;  Files in this program: sxavexrstordriver.cpp, xsavexrstor.asm, run.sh
;  Status: This program was tested by the author many times.
;  Purpose: The purpsoe of this program is to call xsavexrstormain
;
;This file
;  Name: circlemain.asm
;  Language: X86
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l circlemain.lis -o circlemain.o circlemain.asm
;  Purpose: Compute the approximate circumference of a cricle using only integers
;
;
;===== Begin code area ======================================================================================================

extern printf
extern scanf                                     ;External C++ function for writing to standard output device
global circlemain                                 ;This makes circlemain callable by functions outside of this file.

segment .data                                     ;Place initialized data here

welcomemessage db "The circle function is brought to you by Joseph.", 10, 0

inputmessage db "Please enter the radius of a circle in whole number of meters: ", 10, 0
verifyinput db "The Number %6ld was recieved.",10,0
solutionmessage db "the circumference of a circle with this radius is %6ld and %6ld meters.",10,0

goodbye db "The integer part fo the area will be returned to the main program. Please enjoy your circles.", 10, 0


integerformat db "%ld", 0                         ;general decimal integer
stringformat db "%s", 0                           ;general string format



segment .bss                                      ;Place un-initialized data here.

segment .text                                     ;Place executable instructions in this segment.
circlemain:							              ;Entry point.  Execution begins here.

;=========== Back up all the integer registers used in this program =======================================================
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

;=========== Show the welcome message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, welcomemessage                    ;"The circle function is brought to you by Joseph."
call       printf                                 ;Display the message using library function

;=========== Show the welcome message =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, stringformat
mov		   rsi, inputmessage                      ;"Please enter the radius of a circle in whole number of meters: "
call       printf                                 ;Display the message using library function


;=========== Input an integer ============================================================================================================================

push qword 0                                     ;Push 8 bytes solely for the purpose of getting onto an 16-byte boundary.
mov qword  rax, 0                                ;No xmm register are involved in the call to scanf
push qword 0                                     ;Create space in memory for the incoming number
mov        rdi , integerformat                    ;"%ld"
mov        rsi, rsp                              ;rsi points to the quadword of available space in memory
call       scanf
pop        r15                                   ;The cell number is now in r15
pop        rax                                   ;Remove the earlier push regarding the 16-byte boundary

;=========== Print the confirmation input ====================================================================

mov        rax, 0
mov        rsi, r15
mov        rdi, verifyinput                      ;"The Number %ld was recieved."
call       printf

;=========== Find Circumference ====================================================================

                                                 ;formula is 2*r*pi    r15 = r amd 22/7 = pi
mov rax, 44
mul r15                                          ; 2r*22 

                                                 ;(2r*22)/7
cqo

mov r14, 7                                       ; i can try div qword 7 to avoid using a register
div r14					                         ; now in rax and rdx

mov r15, rax
mov r14, rdx

;=========== Print the output ============MAY BE A PROBLEM AREA========================================================


mov        rax, 0
mov        rdi, solutionmessage                   ;"the circumference of a circle with this radius is %6ld and %6ld / 7 meters."
mov        rsi,r15
mov        rdx,r14
call       printf							      ; FRACTIONAL MAY BE WRONG


;=========== Print returning to main =====================================================================================

mov qword  rax, 0                                 ;Zero indicates no data from SSE will be outputted.
mov        rdi, stringformat
mov		   rsi, goodbye                           ;"The integer part fo the area will be returned to the main program. Please enjoy your circles."
call       printf                                 ;Display the message using library function


;=========== Now cleanup and return to the caller =========================================================================

mov qword  rax, r15                               ;Send the integer circumference to main

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

