/*
Your Name: Joseph Haddad

CPSC 240-1 Midterm.
*/
        #include <iostream>
extern "C" int manager();

using namespace std;

int main() {
    cout << "Welcome to 2:30 midterm by Joseph\n"
         << "The array manager will begin\n";

    int returnval=-1;
    returnval = manager();


    cout << "Main received "<<returnval<< " and doesnt know what to do with it\n"
         << "Have a nice day.\n";

    return 0;
}
