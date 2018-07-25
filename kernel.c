static char *scr = (char *)0xb8000; /* bios color video ram */


int
kputc(int x, int y, char chr, char attr) {
	int i;

	i = (x * 2) + ((y * 2) * 80);

	scr[i] = chr;
	scr[i + 1] = attr;
}

void
clrscr(void) {
	int x, y;

	for (x = 0; x < 80; x++)
		for (y = 0; y < 24; y++)
			kputc(x, y, ' ', 0x07);
}

int
kputs(int x, int y, char *str, char attr) {
	int i;
	char *p;

	i = 0;
	p = str;

	while (*p)
		kputc(x + i++, y, *p++, attr);
}

void
kmain(void) {
	clrscr();
	kputs(0, 0, "ABCDEF", 0x04);

	return;
}
