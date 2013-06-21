#include <string.h>
#include <string_asm.h>

int main(void)
{
	char s1[] = "string";
	char s2[] = "string";
	char s3[] = "integer";
	char s4[] = "strini";
	char *s[4] = {NULL};
	s[0] = s1; s[1] = s2; s[2] = s3; s[3] = s4;

	int i, j;
	for(i = 0; i < 4; i++)
	{
		for(j = 0; j < 4; j++)
		{
			if(strcmp_asm(s[i], s[j]) != strcmp(s[i], s[j]))
				return 1;
		}
	}

	return 0;
}
