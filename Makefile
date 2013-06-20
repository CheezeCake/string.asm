AS=yasm
FORMAT=macho64
ARCH=x86_64
ASFLAGS=-f $(FORMAT) -p gas
SRC=$(wildcard src/$(ARCH)/*.s)
OBJ=$(SRC:.s=.o)
TARGET=lib/string_asm.a

all: $(TARGET)

$(TARGET): $(OBJ)
	ar rv $@ $^

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $^

.PHONY: clean mrproper rebuild

clean:
	@rm -f $(OBJ)

mrproper: clean
	@rm $(TARGET)

rebuild: mrproper all
