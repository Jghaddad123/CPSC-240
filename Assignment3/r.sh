#Project: Assignment 2
#Name: Joseph Haddad
#Class: Fall 2020 CPSC 240-01

#    Copyright (C) <2020>  <Joseph Haddad>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#=======================================================================================

echo "The script file has begun"

echo "Compile main.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o main.o -std=c++17 main.cpp

echo "Compile Display_Array.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o Display_Array.o -std=c++17 Display_Array.cpp

echo "Compile BubbleSort.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o bubblesort.o -std=c++17 BubbleSort.cpp

echo "Compile ValidInt.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o ValidInt.o -std=c++17 ValidInt.cpp

echo "Assemble atoL.asm"     # Assemble x86 module.
nasm -f elf64 -l atoL.lis -o atoL.o atoL.asm

echo "Assemble Manager.asm"     # Assemble x86 module.
nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm

echo "Assemble Input_Array.asm"     # Assemble x86 module.
nasm -f elf64 -l Input_Array.lis -o Input_Array.o Input_Array.asm

echo "Assemble swap.asm"     # Assemble x86 module.
nasm -f elf64 -l swap.lis -o swap.o swap.asm

echo ""
echo "Link the object files"

g++ -m64 -fno-pie -no-pie -o executable.out -std=c++17 main.o ValidInt.o Manager.o bubblesort.o atoL.o Input_Array.o swap.o Display_Array.o 

echo ""
echo "Run the program"
echo ""
./executable.out


#!/bin/bash
rm *.o
rm *.lis

echo "The script file will terminate"
echo ""