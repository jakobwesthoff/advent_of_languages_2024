AS = as
LD = ld

ASFLAGS = -arch arm64

SRC = hello_xmas.s
OBJ = $(SRC:.s=.o)
EXEC = hello_xmas

all: $(EXEC)

$(EXEC): $(OBJ)
	$(LD) -o $@ $^

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(EXEC)

run: $(EXEC)
	./$(EXEC)

.PHONY: all clean run
