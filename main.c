#include "cdecl.h"
#include <stdio.h>
#include <string.h>


int PRE_CDECL asm_main( void ) POST_CDECL;

int main(int argc, char *argv[])
{
    if (argc != 5)
    {
        fprintf(stderr,"Usage: d/b(dec or bin) number +/- number ");
    }
    if (argv[3] != '+'  || argv[3] != '-')
    {
        fprintf(stderr,"Usage: d/b(dec or bin) number +/- number ");
    }
    if (argv[2] != 'd'  || argv[2] != 'b')
    {
        fprintf(stderr,"Usage: d/b(dec or bin) number +/- number ");
    }



    int ret_status;
    ret_status = asm_main();
    return ret_status;
}
