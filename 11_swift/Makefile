SWIFT = swift
SWIFTC = swiftc
SWIFT_FLAGS = -O

SOURCE = hello_xmas.swift
EXECUTABLE = hello_xmas

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCE)
	$(SWIFTC) $(SWIFT_FLAGS) $(SOURCE) -o $(EXECUTABLE)

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -f $(EXECUTABLE)

dev:
	$(SWIFT) $(SOURCE)

.PHONY: all run clean dev
