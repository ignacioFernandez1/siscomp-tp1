calc:
	nasm -f elf suma.asm
	gcc -m32 -c -o main.o main.c
	nasm -f elf -d ELF_TYPE asm_io.asm
	gcc -m32  main.o suma.o asm_io.o -o calc

clean:
	rm *.o calc