all: kc.o kasm.o kernel

kc.o: kernel.c
	gcc -m32 -c kernel.c -o kc.o

kasm.o: kernel.asm
	nasm -f elf32 kernel.asm -o kasm.o

kernel: kc.o kasm.o
	ld -m elf_i386 -T link.ld -o kernel kc.o kasm.o

run: kernel
	qemu-system-i386 -kernel kernel

clean:
	rm -f kc.o kasm.o kernel
