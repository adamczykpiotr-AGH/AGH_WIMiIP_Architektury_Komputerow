CCOMP = nasm
LINKER = gcc

FILENAME = srednia_c

# OPT =


$(FILENAME): $(FILENAME).o
	$(LINKER) $(OPT) $(FILENAME).o -o $(FILENAME)

$(FILENAME).o: $(FILENAME).asm
	$(CCOMP) $(OPT) -f elf64 $(FILENAME).asm

clean:
	rm -f *.o
