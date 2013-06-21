#include <string.h>
#include <string_asm.h>

int main(void)
{
	char *s = NULL;
	char s1[10] = "abcde";
	char s2[5] = "fghi";
	char result[] = "abcdefghi";

	s = strcat_asm(s1, s2);
	if((s != s1) || (strcmp(s1, result) != 0))
		return 1;
	
	return 0;
}
