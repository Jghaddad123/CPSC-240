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
;  Program name: isfloat
;  Programming languages: 1 module in C++
;  Date program began: 2020-Nov-10
;  Date of last update: 2020-Nov-10
;  Status: This program was tested by the author many times.
;
;This file
;  Name: isfloat.cpp
;  Language: C++
;  Syntax: Intel
;  Assemble: g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp
;
;  Purpose: check a given string to see if it is a float and return bool 1 for true and 0 for false
;
;
;===== Begin code area =======================================================================================
*/
#include <iostream>
using namespace std;
extern "C" bool isfloat(string string);


bool isfloat(string string){                                                    //Call function passing parameter string expecting boolean return
    string::const_iterator it = string.begin();                                 // holds position 0 in string
    // the line above can be substituted with a "int it=0;" but then need to do "string[it]" everywhere that "*it" is and "string.size" for all "string.end()"

    bool decimalPoint = false;                                                  // create boolean for checking decimal later initially false = no decimal in string yet
    long unsigned int minSize = 0;

    if (string.size() > 0 && (string[0] == '-' || string[0] =='+')) {           // checks for - or + and only allows them for position 0 in string
        it++;                                                                   // increments constant iterator
        minSize++;
    }

    while (it != string.end()) {                                                //while it < size of string
        if (*it == '.') {                                                       // if *it is decimal make decimalPoint true
            if (!decimalPoint){ decimalPoint = true;}
            else break;                                                                             // else return false
        } else if (!isdigit(*it) && ((*it != 'f') || it + 1 != string.end() || !decimalPoint)) {    //checks if it is a float
            break;
        }
        ++it;
    }
    return string.size() > minSize && it == string.end();
}
