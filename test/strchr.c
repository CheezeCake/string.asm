#include <string.h>

char* strchr_asm(const char*, int);

int main(void)
{
	char s1[] = "abcde";
	char s2[] = "fghijklmnop";

	if((strchr_asm(s1, 'b') != strchr(s1, 'b')) ||
	   (strchr_asm(s2, '\0') != strchr(s2, '\0')))
		return 1;
	
	return 0;
}
