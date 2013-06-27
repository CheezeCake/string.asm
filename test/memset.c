#include <string.h>
#include <string_asm.h>

int main(void)
{
	char buffer[100] = {1};
	memset_asm(buffer, 5, 100);
	
	int i;
	for(i = 0; i < 100; i++)
		if(buffer[i] != 5)
			return 1;

	return 0;
}
