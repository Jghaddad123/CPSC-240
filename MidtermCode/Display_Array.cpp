/*
;This is a library function distributed without accompanying software.                                                      *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public   *
;License version 3 as published by the Free Software Foundation.  This program is distributed in the hope that it will be   *
;useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.*
;See the GNU General Public License for more details.  A copy of the GNU Lesser General Public License 3.0 should have been *
;distributed with this function.  If the LGPL does not accompany this software then it is available here:                    *
;<https:;www.gnu.org/licenses/>.  
;
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
;  Name: Display_Array.cpp
;  Language: C++
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l Display_Array.lis -o Display_Array.o Display_Array.cpp
;  Purpose: Display a given array to the user
;
;
;===== Begin code area =======================================================================================
*/

#include <iostream>
using namespace std;

extern "C" void Display_Array(long int[],int);
void Display_Array(long int arr[],int size) {
int i = 0;

    cout<<"The values in the array are: ";
    while(i<size){
        cout<<arr[i++]<<" ";
    }
    cout<<"\n";

    return;
}
