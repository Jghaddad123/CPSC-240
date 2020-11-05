
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

inputmessage db "Please enter the radius of a circle as a floating point number: ", 10, 0
verifyinput db "The Number %6lf was recieved.",10,0
solutionmessage db "the circumference of a circle with this radius is %6lf meters. Please enjoy your circles.", 10, 0


floatformat db "%lf", 0                         ;general decimal integer
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
;pushf                                             ;Back up rflags

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
push qword 0                                     ;Create space in memory for the incoming number
mov        rax, 1                                ;No xmm register are involved in the call to scanf
mov        rdi , floatformat                           ;"%lf"
mov        rsi, rsp                              ;rsi points to the quadword of available space in memory
call       scanf

movsd xmm15, [rsp]
pop        r12                                   ;Remove the earlier push regarding the 16-byte boundary

;=========== Print the confirmation input ====================================================================
push qword 0                                     ;make even with mod 16
mov rax, 1
mov rdi, verifyinput
movsd xmm0, xmm15
call printf
pop rax

;=========== Find Circumference ====================================================================
mov r14, 0x400921FB54442D18                        ;pie in ieee754
movq xmm14, r14
                  

mov r13, 0x4000000000000000                ;2.0 in IEEE-754
movq xmm13, r13                           ;Moving r13 into an xmm

mulsd xmm15, xmm14                        ;Circumference = radius * pi
mulsd xmm15, xmm13                        ;Circumference *= 2

;=========== Print the output ============MAY BE A PROBLEM AREA========================================================


push qword 0                                     ;Create space in memory for the incoming number

mov        rax, 1
mov        rdi, solutionmessage                   ;"the circumference of a circle with this radius is %6lf."
movsd        xmm0,xmm15
call       printf							     
pop rax                                     ;Create space in memory for the incoming number


movsd        xmm0,xmm15


;=========== Now cleanup and return to the caller =========================================================================


;popf                                              ;Restore rflags
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

