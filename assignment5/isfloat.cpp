/*
Copyright © 2007 Free Software Foundation, Inc. <https://fsf.org/>

Everyone is permitted to copy and distribute verbatim copies of this license document, but changing it is not allowed.
This version of the GNU Lesser General Public License incorporates the terms and conditions of version 3 of the GNU General Public License, supplemented by the additional permissions listed below.

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
extern "C" bool isfloat(char temp[]);


bool isfloat(char temp[]){     
    string s;
    s = temp;
                                                   //Call function passing parameter string expecting boolean return
    string::const_iterator it = s.begin();                                 // holds position 0 in string
    // the line above can be substituted with a "int it=0;" but then need to do "string[it]" everywhere that "*it" is and "string.size" for all "string.end()"

    bool decimalPoint = false;                                                  // create boolean for checking decimal later initially false = no decimal in string yet
    long unsigned int minSize = 0;

    if (s.size() > 0 && (s[0] =='+')) {           // checks for - or + and only allows them for position 0 in string
        it++;                                                                   // increments constant iterator
        minSize++;
    }

    while (it != s.end()) {                                                //while it < size of string
        if (*it == '.') {                                                       // if *it is decimal make decimalPoint true
            if (!decimalPoint){ decimalPoint = true;}
            else break;                                                                             // else return false
        } else if (!isdigit(*it) && ((*it != 'f') || it + 1 != s.end() || !decimalPoint)) {    //checks if it is a float
            break;
        }
        ++it;
    }
    return s.size() > minSize && it == s.end();
}
