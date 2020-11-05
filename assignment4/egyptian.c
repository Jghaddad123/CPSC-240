#include <stdio.h>
#include <stdint.h>

extern double circlemain();

int main() {
	double returnval = -1;
//	double* val;
//	void* t;

//	val = &returnval;
//	t=val;

	printf("%s", "Welcome to your friendly circle circumference calculator.\n");
	printf("%s", "The main program will now call the circle function.\n");

	returnval = circlemain();

	printf("%s%f%s%lx", "The Main recieved this integer: ", returnval," = 0x",*(long unsigned*)&returnval);
	printf("%s", "\nHave a nice day. Main will now return 0 to the operating system\n");

	return 0;
}//End of main
