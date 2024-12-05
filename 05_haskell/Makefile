# Advent of languages - Day 05: Haskell
# Makefile using Docker to build the haskell application

DOCKER_IMAGE = haskell:9
SOURCE_FILE = Main.hs
OUTPUT = hello_xmas

# Detect architecture (needed for my macbook with apple silicon)
ARCH := $(shell uname -m)
ifeq ($(ARCH),arm64)
    PLATFORM = --platform linux/arm64
else
    PLATFORM = --platform linux/amd64
endif

DOCKER_RUN = docker run --rm $(PLATFORM) -v $(PWD):/app -w /app $(DOCKER_IMAGE) 

# Default target
all: $(OUTPUT)

# Compile the Haskell source file
$(OUTPUT): $(SOURCE_FILE)
	$(DOCKER_RUN) ghc -o $(OUTPUT) $(SOURCE_FILE) -static

# Clean build artifacts
clean:
	rm -f $(OUTPUT)
	rm -f *.hi
	rm -f *.o

# Run the compiled program within the docker container for simplicity
run: $(OUTPUT)
	$(DOCKER_RUN) ./$(OUTPUT)

.PHONY: all clean run
