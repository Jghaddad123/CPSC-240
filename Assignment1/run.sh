#Project: Assignment 1: Circumference Of A Circle
#Name: Joseph Haddad
#Class: Fall 2020 CPSC 240-01

#    Copyright (C) <2020>  
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
echo "The script file for Circumference Of A Circle has begun"

echo "Assemble circle.asm"     # Assemble x86 module.
nasm -f elf64 -o circle.o -l circle.lis circle.asm

echo "Compile egyptian.c"     # Compile C module.
gcc -c -Wall -m64 -no-pie -o egyptian.o egyptian.c -std=c11

echo "Link the object files"
gcc -m64 -no-pie -o executable.out -std=c11 circle.o egyptian.o

echo "Run the program Circumfarence Of A Circle:"
./executable.out

echo "The script file will terminate"


