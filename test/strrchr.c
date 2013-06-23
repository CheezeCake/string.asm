#include <string.h>
#include <string_asm.h>

int main(void)
{
	char s1[] = "abcdefg";
	char s2[] = "";

	if((strrchr_asm(s1, 'd') != strrchr(s1, 'd')) || 
			(strrchr_asm(s2, '\0') != strrchr(s2, '\0')) || 
			(strrchr_asm(s2, 'a') != strrchr(s2, 'a')))
		return 1;
	
	return 0;
}
