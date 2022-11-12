FILENAME = step2
OBJ_FOLDER = ../../obj/
BIN_FOLDER = ../../bin/

FILE	= $(FILENAME).asm
OBJECT	= $(OBJ_FOLDER)$(FILENAME).o
BINARY 	= $(BIN_FOLDER)$(FILENAME)


all: prepare build run

build:
	nasm -f elf32 $(FILE) -o $(OBJECT)
	ld -m elf_i386 $(OBJECT) -o $(BINARY)

prepare:
	mkdir -p $(OBJ_FOLDER)
	mkdir -p $(BIN_FOLDER)

run:
	$(BINARY)