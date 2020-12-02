#include <stdio.h>
#include <stdint.h>

extern "C" int manager();

int main() {
	int returnval = -1;
	returnval = manager();

	printf("%s%d", "The Main recieved this integer: ", returnval);
	printf("%s", "\nHave a nice day. Main will now return 0 to the operating system\n");

	return 0;
}//End of main
