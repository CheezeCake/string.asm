#ifndef _STRING_ASM_H_
#define _STRING_ASM_H_

#include <sys/types.h>

char* strcat_asm(char*, const char*);
char* strchr_asm(const char*, int);
int strcmp_asm(const char*, const char*);
char* strcpy_asm(char*, const char*);
size_t strlen_asm(const char*);
char* strrchr_asm(const char*, int);

#endif
