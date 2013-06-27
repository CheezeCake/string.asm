#include <string.h>
#include <string_asm.h>

int main(void)
{
	char buffer[100] = {1};
	bzero_asm(buffer, 100);
	
	int i;
	for(i = 0; i < 100; i++)
		if(buffer[i] != 0)
			return 1;

	return 0;
}
