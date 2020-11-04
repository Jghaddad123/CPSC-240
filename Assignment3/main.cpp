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
extern "C" int manager();
extern "C" long int read_clock();

using namespace std;

int main() {
     long int starttics = read_clock();
     cout<<"The time on the CPU clock is: "<<starttics<<endl;

     cout << "Welcome to Arrays sorter\n"
         << "Brought to you by Joseph Haddad\n";

     manager();


     cout// << "Main received "<<returnval<<" and is not sure what to do with it.\n"
         << "Main will return 0 to the operating system.   Bye.\n";
     long int endtics = read_clock();
     cout<<"The time on the CPU clock is: "<<endtics<<endl;
     
     long int difference = endtics-starttics;
     cout<<"The time difference is: "<<difference<<endl<<endl;


     return 0;
}
