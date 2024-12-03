CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c99
TARGET = hello_xmas
SRC = hello_xmas.c

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

.PHONY: clean
clean:
	rm -f $(TARGET)

.PHONY: run
run: $(TARGET)
	./$(TARGET)
