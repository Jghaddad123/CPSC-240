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
g++ -c -m64 -Wall -fno-pie -no-pie -o main.o main.cpp

echo "Assemble manager.asm"     # Assemble x86 module.
nasm -f elf64 -o manager.o manager.asm

echo "Assemble read_clock.asm"     # Assemble x86 module.
nasm -f elf64 -o read_clock.o read_clock.asm

echo ""
echo "Link the object files"

g++ -m64 -fno-pie -no-pie -o executable.out main.o manager.o read_clock.o

echo ""
echo "Run the program"
echo ""
./executable.out


#!/bin/bash
rm *.o
rm *.lis

echo "The script file will terminate"
echo ""