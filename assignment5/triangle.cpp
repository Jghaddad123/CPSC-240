/*
;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: Triangle area
;  Programming languages: 2 modules in C++, 1 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-Nov-10
;  Date of last update: 2020-Nov-10
;  Status: This program was tested by the author many times.
;
;This file
;  Name: triangle.cpp
;  Language: C++
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l triangle.lis -o triangle.o triangle.cpp
;  Purpose: Manage the process of adding an array given by the user
;
;
;===== Begin code area =======================================================================================
*/
        #include <iostream>
extern "C" double area();
using namespace std;

int main() {
    double result=0;
     cout << "Welcome to Triangle area finder\n"
         << "Brought to you by Joseph Haddad\n";

     result = area();
     printf("%s%lx%s", "\nThe driver received this number, 0x ", *(unsigned long*)&result, " and will keep it. \n");
     cout << "Now 0 will be returned to the operating system. Bye\n";
     return 0;
}
