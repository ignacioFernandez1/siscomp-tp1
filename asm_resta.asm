

global asm_resta

%include "asm_io.inc"

segment .text

%define num1 [ebp + 8]
%define num2  [ebp + 12]

asm_resta:
    enter   0,0 

    mov eax, num1
    sub eax, num2
    call print_int  ; printea el contenido de  eax
    call print_nl   ; print salto de linea

    leave
    ret
    

