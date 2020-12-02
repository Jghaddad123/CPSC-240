
;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: sumation addition
;  Programming languages: 1 modules in C++, 2 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-dec-3
;  Date of last update: 2020-dec-3
;  Status: This program was tested by the author many times.
;
;This file
;  Name: manager.asm
;  Language: X86
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm
;  Purpose: Manage the process of adding an array given by the user
;
;
;===== Begin code area =======================================================================================

extern printf
extern scanf                                     ;External C++ function for writing to standard output device
extern read_clock
global manager                                    ;This makes Manage callable by functions outside of this file.

segment .data                                    ;Place initialized data here

welcomemessage1 db "Welcome to the Harmonic Sum programmed by Joseph Haddad.",10,0
welcomemessage2 db "Please enter the number of terms to be included in the sum: ",10,0

welcomemessage3 db "The clock is now %8ld tics and the computation will begin.", 10, 0
welcomemessage4 db "The clock is now %8ld tics.", 10, 0
welcomemessage5 db "The elapsed time was %8ld tics, which equals %6ld seconds.", 10, 0


message4        db "These number were received and placed into the array:", 10, 0
message5        db "The sum of the %6ld numbers in this array is %6ld.",10,0
goodbye6        db "The sum will now be returned to the main function.", 10, 0

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

;=========== Show the welcome message =========================================================================

push rax
mov        rdi, stringformat
mov        rsi, welcomemessage1
call       printf                                 ;Display the message using library function

mov        rdi, stringformat
mov        rsi, welcomemessage2
call       printf                                 ;Display the message using library function
pop rax

;=========== take in user input and verify array =================================================================

push qword 0
mov      rax,0
mov      rdi, integerformat
mov      rsi, rsp
call scanf                        ;read in array as string
pop rax
mov r13, rax                 ; store num of iterations

;===========get time =====================================================================================
xor rax, rax
call read_clock
mov r14, rax                 ;store start time in r15


mov        rdx, r14
mov        rdi, stringformat
mov        rsi, welcomemessage3
call       printf                                 ;Display the message using library function


;===========Sum of n =====================================================================================
mov r12, 2
mov r11, 2                    ;hold incrementor
push r12
push r12

cvtsi2pd xmm7,[rsp]            ;xmm7 = 2|2

pop r12
mov r12, 1
push r12
cvtsi2pd xmm10,[rsp]           ;xmm10 = 1|2 or 2|1 doesnt matter
pop r12
pop r12

mov r12, 0
push r12
push r12

cvtsi2pd xmm8,[rsp]            ;xmm8 = 0|0
pop r12
pop r12

mov r12, 1
push r12
push r12
cvtsi2pd xmm9,[rsp]            ;xmm9 = 1|1
pop r12
pop r12

movpd xmm8, xmm9               ;xmm8 = 1|1
mov r12, 1                     ;lower index

startloop:
cmp r13, r12
jle done                       ;if less then or equal to 1 remaining end

divpd xmm9, xmm10              ; 1/n | 1/n+1
addpd xmm8, xmm9               ; sum + (1/n) | sum + (1/n+1)
addpd xmm10, xmm7              ; increment n by 2
movpd xmm9, xmm8

sub r13, r11
jmp startloop
done:

mov r12, 0
cmp r13,r12
je completedloop




;need to add a single 1/n                    <======================================================================!!!!!!!!!!!!!

completedloop:
;need to combine both sides of xmm8               <======================================================================!!!!!!!!!!!!!









;===========get time =====================================================================================
xor rax, rax
call read_clock
mov r15, rax                 ;store start time in r15


mov        rdx, r15
mov        rdi, stringformat
mov        rsi, welcomemessage4
call       printf                                 ;Display the message using library function


sub r15, r14
mov        rdx, r15

; need to devide r15 by 60   <================================================================!!!!!!!!!!!!!!
; i think it was like this 
mov r14, 60
cedge
div r15, r14

mov rax, 1
mov        rdi, stringformat
mov        rsi, welcomemessage5
call       printf                                 ;Display the message using library function



mov        rax, r15

;=========== restore all the integer registers used in this program =======================================================

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
