/*
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
extern "C" int manager();

using namespace std;

int main() {
    cout << "Welcome to Arrays of Integers\n"
         << "Bought to you by Joseph Haddad\n";

    manager();


    cout// << "Main received "<<returnval<<" and is not sure what to do with it.\n"
         << "Main will return 0 to the operating system.   Bye.\n";

    return 0;
}
