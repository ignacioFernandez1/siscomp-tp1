calc:
	nasm -f elf suma.asm
	nasm -f elf b_suma.asm
	nasm -f elf resta.asm
	nasm -f elf b_resta.asm
	gcc -m32 -c -o main.o main.c
	nasm -f elf -d ELF_TYPE asm_io.asm
	gcc -m32  main.o suma.o resta.o b_suma.o b_resta.o asm_io.o -o calc

clean:
	rm *.o calc