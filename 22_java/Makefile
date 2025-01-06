SOURCE := $(PWD)
SOURCES := *.java
MAIN := HelloXmas

DOCKER_IMAGE := eclipse-temurin:23-jdk-alpine

.PHONY: build run clean

build: $(MAIN).class

$(MAIN).class: $(MAIN).java
	docker run --rm -v "$(SOURCE):/app" -w /app $(DOCKER_IMAGE) javac $(SOURCES)

run: $(MAIN).class
	docker run --rm -v "$(SOURCE):/app" -w /app $(DOCKER_IMAGE) java $(MAIN)

clean:
	rm -f $(SOURCE)/*.class
