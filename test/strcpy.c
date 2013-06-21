#include <string.h>
#include <string_asm.h>

int main(void)
{
	char *s = NULL;
	char s1[5] = "";
	char s2[5] = "abcd";
	char s3[5] = "efgh";

	s = strcpy_asm(s2, s1);
	if((s != s2) || (strcmp(s1, s2) != 0))
		return 1;
	
	s = strcpy(s1, s3);
	if((s != s1) || (strcmp(s1, s3) != 0))
		return 1;
	
	return 0;
}
