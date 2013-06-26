#ifndef _STRING_ASM_H_
#define _STRING_ASM_H_

#include <sys/types.h>

void bzero_asm(void*, size_t);
void* memset_asm(void*, int, size_t);
char* strcat_asm(char*, const char*);
char* strchr_asm(const char*, int);
int strcmp_asm(const char*, const char*);
char* strcpy_asm(char*, const char*);
size_t strlen_asm(const char*);
char* strrchr_asm(const char*, int);
size_t strspn_asm(const char*, const char*);

#endif
