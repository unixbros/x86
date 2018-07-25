bits 32
section .text
	; multiboot
	align 4
	dd 0x1badb002 ; ONEBADBOOT
	dd 0x00
	dd - (0x1badb002 + 0x00) ; chksum

global start
extern kmain

start:
	cli
	mov esp, stack_space
	call kmain
	hlt

section .bss
resb 8192
stack_space:
