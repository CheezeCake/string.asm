#include <string_asm.h>

int main(void)
{
	char s1[5] = "abcd";
	char s2[] = "";

	if((strlen_asm(s1) != 4) || (strlen_asm(s2) != 0))
		return 1;
	
	return 0;
}
