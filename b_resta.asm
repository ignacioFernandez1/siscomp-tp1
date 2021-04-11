

global asm_b_resta

%include "asm_io.inc"

segment .data

binary db "0b", 0

segment .text

%define num1 [ebp + 8]
%define num2  [ebp + 12]

asm_b_resta:
    enter   0,0 
    
    xor edi, edi ; edi se usa como flag (set a 0)
    mov eax, num1
    sub eax, num2

    mov ecx, 32 ; tamaño maximo de caracteres para el binario que se imprime
    mov ebx, eax
    mov eax, binary 
    call print_string ; print '0b'
conversion:
    xor eax,eax ; eax = 0
    shl ebx, 1  ; ebx << 1
    jc  bit1    ; si el bit es 1, se pasa a la label bit1
    cmp edi, 0  ; edi se usa de flag, para no imprimir los ceros a la izquierda del primer uno
    je  skip
    mov eax,0   ; eax = 0
    call print_int ; print 0
    jmp skip
bit1:
    inc edi
    mov eax,1
    call print_int ; print 1
skip:
    loop conversion

    call print_nl
    leave
    ret
    