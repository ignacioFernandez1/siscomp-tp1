//#include "cdecl.h"
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include "cdecl.h"

void PRE_CDECL asm_suma(long n1, long n2) POST_CDECL;
void PRE_CDECL asm_b_suma(long n1, long n2) POST_CDECL;
void PRE_CDECL asm_resta(long n1, long n2) POST_CDECL;
void PRE_CDECL asm_b_resta(long n1, long n2) POST_CDECL;

int main(int argc, char *argv[])
{
    char *num1, *num2;
    long n1, n2;
    int flagb = 0;
    int flag_resta = 0;
    if (argc != 4)
    {
        fprintf(stderr, "Usage: %s number +/- number (number puede ser decimal o binario)", argv[0]);
        exit(EXIT_FAILURE);
    }
    if (strcmp(argv[2], "+") != 0)
    {
        if (strcmp(argv[2], "-") != 0)
        {
            fprintf(stderr, "Usage: %s number +/- number (number puede ser decimal o binario)", argv[0]);
            exit(EXIT_FAILURE);
        }
        else
            flag_resta = 1;
    }

    if (argv[1][0] == 'b')
    {
        n1 = strtol(strdup(&argv[1][1]), &num1, 2);
        if (n1 == 0)
        {
            printf("Error: invalid binary number\n"); // con perror te printea cualquier cosa
            exit(EXIT_FAILURE);
        }
        flagb = 1;
    }
    else
    {
        n1 = atoi(argv[1]);
        if (n1 == 0)
        {
            printf("Error: invalid decimal number\n"); // solo falla cuando ingresas numero tipo asd23 pero si ingresas 23asd te lo toma al 23 y no falla
            exit(EXIT_FAILURE);
        }
    }

    if (argv[3][0] == 'b')
    {
        n2 = strtol(strdup(&argv[3][1]), &num2, 2);
        if (n2 == 0)
        {
            printf("Error: invalid binary number\n");
            exit(EXIT_FAILURE);
        }
    }
    else
    {
        n2 = atoi(argv[3]);
        if (n2 == 0)
        {
            printf("Error: invalid decimal number\n");
            exit(EXIT_FAILURE);
        }
    }

    if (flagb)
    {
        if (flag_resta)
        {
            asm_b_resta(n1, n2);
        }
        else
        {
            asm_b_suma(n1, n2);
        }
    }
    else
    {
        if (flag_resta)
        {
            asm_resta(n1, n2);
        }
        else
        {
            asm_suma(n1, n2);
        }
    }

    return 0;
}
