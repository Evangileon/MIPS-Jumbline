#ifndef __COMMON_JUMBLINE_RJ__
#define __COMMON_JUMBLINE_RJ__

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/signal.h>
#include <fcntl.h>
#include <unistd.h>
#include <strings.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned char byte;
typedef unsigned short ushort;
typedef unsigned long ulong;
typedef unsigned int uint;

#ifdef __DEBUG__
        #define DEBUG(format, ...) do { fprintf(stderr, format, ##__VA_ARGS__); }while(0)
#else
        #define DEBUG(format, ...) do { }while(0)
#endif

#define ERROR(format, ...) do { fprintf(stderr, format, ##__VA_ARGS__); exit(-1); }while(0)

#define INFO(format, ...) do { fprintf(stdout, format, ##__VA_ARGS__); }while(0)
	    
#endif
