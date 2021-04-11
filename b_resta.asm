

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

    mov ecx, 32
    mov ebx, eax
    mov eax, binary
    call print_string
conversion:
    xor eax,eax
    shl ebx, 1     
    jc  bit1
    cmp edi, 0
    je  skip
    mov eax,0
    call print_int
    jmp skip
bit1:
    mov edx, 1
    inc edi
    mov eax,1
    call print_int
skip:
    loop conversion

    call print_nl
    leave
    ret
    