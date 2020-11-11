#Project: Assignment 5: area of a triangle
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

echo "Assemble area.asm"     # Assemble x86 module.
nasm -f elf64 -o area.o -l area.lis area.asm

echo "Compile isfloat.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp

echo "Compile triangle.cpp"     # Compile C module.
g++ -c -m64 -Wall -fno-pie -no-pie -o triangle.o triangle.cpp

echo "Link the object files"
g++ -m64 -fno-pie -no-pie -o executable.out -std=c++17 triangle.o isfloat.o area.o

echo "Run the program Area Of A Triangle:"
echo ""
./executable.out


rm *.o
rm *.lis
echo ""
echo "The script file will terminate"
