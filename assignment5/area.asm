;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: Triangle area
;  Programming languages: 2 modules in C++, 1 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-Nov-10
;  Date of last update: 2020-Nov-10
;  Status: This program was tested by the author many times.
;  Purpose: The purpsoe of this program is to call xsavexrstormain
;
;This file
;  Name: area.asm                                                               
;  Language: X86                                                                
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l area.lis -o area.o area.asm
;  Purpose: Compute the area of a triangle using floats
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
mov r14, 0                  ;itterations

sub rsp, 64                     ;subtract here so it only subracts once in entire program
jmp Begin
;========================================================         Error         ===========================================================
Error:
mov r14, 0                      ;itterations
mov rax, 0
mov rdi, errormessage           ; restarting     
call printf
;========================================================       Scan in       ===========================================================
Begin:
mov rax, 0
mov rdi, stringformat      ;doing string to verify before float
mov rsi, rsp
call scanf
;========================================================   check validity  ===========================================================
mov rdi, rsp
mov rax, 1 
call isfloat

mov r15, 0 
cmp rax, r15      ;checking if rax 0 or 1 if 0 error else valid
je Error
;========================================================  convert to float  ===========================================================
mov rax, 0
mov rdi, rsp
call atof
movsd xmm13, xmm0
;========================================================  loop through placing value in variables  ===========================================================
First:
mov r15,0
cmp r14,r15
jne Second
movsd xmm15, xmm13  

Second:
mov r15,1
cmp r14,r15
jne Third
movsd xmm14, xmm13  

Third:
mov r15,2
cmp r14,r15
je Finished

Loop:
inc r14
jmp Begin

Finished:
movsd xmm13, xmm13 
add rsp, 64



xor rax, rax
mov rdi, confermmessage ;"These values were received:  %.8lf  %.8lf  %.8lf " 
mov rax, 3              ;Print 3 floating point
movsd xmm0, xmm15       ;Print side one
movsd xmm1, xmm14       ;Print side two
movsd xmm2, xmm13       ;Print side three
call printf
;========================================================  finding S  ===========================================================
; s = (s1+s2+s3)/2

movsd xmm12, xmm13                     ;S = side13
addsd xmm12, xmm15
addsd xmm12, xmm14
;at this point S=s1+s2+s3

mov r13, 0x4000000000000000         ;2.0 in IEEE-754
movq xmm11, r13

divsd xmm12, xmm11      
;at this point s = (s1+s2+s3)/2
;========================================================  finding (S - Side)  ===========================================================
movsd xmm11, xmm12                 ;xmm11 holds s
subsd xmm11, xmm15
movsd xmm15, xmm11                 ;xmm15 holds (s-a)

movsd xmm11, xmm12                 ;xmm11 holds s
subsd xmm11, xmm14
movsd xmm14, xmm11                 ;xmm14 holds (s-b)

movsd xmm11, xmm12                 ;xmm11 holds s
subsd xmm11, xmm13
movsd xmm13, xmm11                 ;xmm14 holds (s-c)
;========================================================  S(S1)(S2)(S3)  ===========================================================
mulsd xmm12, xmm15        ; =S(S1)
mulsd xmm12, xmm14        ; =S(S1)(S2)
mulsd xmm12, xmm13        ; =S(S1)(S2)(S3)
;========================================================  sqrt(final)  ===========================================================
sqrtsd xmm15, xmm12
;========================================================  areamessage  ===========================================================
mov rax, 1
mov rdi, areamessage           ; area message 
movsd xmm0, xmm15    
call printf
;=========== Now cleanup and return to the caller =========================================================================
movsd xmm0, xmm15    

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
