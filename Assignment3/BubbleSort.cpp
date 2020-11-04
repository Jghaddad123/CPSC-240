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
;  Program name: Array sort
;  Programming languages: 4 modules in C++, 5 module in X86-64, and 1 module in Bash.
;  Date program began: 2020-Nov-3
;  Date of last update: 2020-Nov-3
;  Status: This program was tested by the author many times.
;
;This file
;  Name: BubbleSort.cpp
;  Language: C++
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l BubbleSort.lis -o BubbleSort.o BubbleSort.cpp
;  Purpose: sort a given array least to greatest
;
;
;===== Begin code area =======================================================================================
*/

#include <iostream>
using namespace std;

extern "C" void swap(int, int);
extern "C" void BubbleSort(long int[], int);

void BubbleSort(long int arr[], int size) {
    int i, j;
    for (i = 0; i < size - 1; i++)
        // Last i elements are already in place
        for (j = 0; j < size - i - 1; j++)
            if (arr[j] > arr[j + 1])
                swap(arr[j], arr[j + 1]);
    return;


}
