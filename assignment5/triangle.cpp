/*
;Author information
; Author name: Joseph Haddad
;
;Program information
;  Program name: Array Sum
;  Programming languages: 4 modules in C++, 5 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-Nov-3
;  Date of last update: 2020-Nov-3
;  Status: This program was tested by the author many times.
;
;This file
;  Name: main.cpp
;  Language: C++
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l Manager.lis -o Manager.o Manager.cpp
;  Purpose: Manage the process of adding an array given by the user
;
;
;===== Begin code area =======================================================================================
*/
        #include <iostream>
extern "C" float area();
using namespace std;

int main() {
     
     cout << "Welcome to Triangle area finder\n"
         << "Brought to you by Joseph Haddad\n";

     area();


     return 0;
}
