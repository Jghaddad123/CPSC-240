#include <stdio.h>
#include <stdint.h>

long int circlemain();

int main() {
	int returnval = -1;
	printf("%s", "Welcome to your friendly circle circumference calculator.\n");
	printf("%s", "The main program will now call the circle function.\n");

	returnval = circlemain();

	printf("%s%d", "The Main recieved this integer: ", returnval);
	printf("%s", "\nHave a nice day. Main will now return 0 to the operating system\n");

	return 0;
}//End of main
