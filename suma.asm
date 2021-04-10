

global asm_suma, asm_resta

%include "asm_io.inc"

segment .text

%define dest [ebp + 8]
%define src  [ebp + 12]

asm_suma:
    enter   0,0 ; ni idea para que es --- creo que es para hacer espacio en la pila pero no nos hace falta

    add dest, src
    mov eax, [dest] ; Vi en algunos codigos que le pasa el resultado asi para imprimirlo pero no entiendo porque no es directamente dest
    call print_int  ; esto imprime lo que hay en eax
    call print_nl   ; salto de linea

    leave
    ret
    
; no se que mas haria falta la verdad porque es tan simple como eso.    

; NO TENGO LA MENOR IDEA DE SI ESTO ESTA BIEN LA VERDAD COPIE DESDE MEMORY.ASM EL METODO DE ASM_STRCPY
; Y ENCIMA NO PUEDO COMPILAR EL ASM TODAVIA XD
