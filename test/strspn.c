#include <string.h>
#include <string_asm.h>

int main(void)
{
	char str[] = "abcde312$#@";
	char charset[] = "qwertyuiopasdfghjklzxcvbnm";

	if((strspn_asm(str, charset) != strspn(str, charset)))
		return 1;

	return 0;
}
