#ifndef HEADER_FILE_ENERGY
#define HEADER_FILE_ENERGY

#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include <time.h>

extern void rapl_init_(void);
extern void start_rapl_sysfs_();
extern void end_rapl_sysfs_(double *energia);

#endif
