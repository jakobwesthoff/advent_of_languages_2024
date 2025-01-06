.PHONY: all build run clean docker-build

PROJECT_NAME = hello_xmas
DOCKER_IMAGE = advent-of-languages-zig-builder

all: docker-build build

docker-build:
	@if ! docker images -q $(DOCKER_IMAGE) | grep -q .; then \
		docker build -t $(DOCKER_IMAGE) .; \
	fi

build: docker-build
	docker run --rm -v $(PWD):/app -w /app $(DOCKER_IMAGE) zig build-exe $(PROJECT_NAME).zig

run: docker-build build
	docker run --rm -it -v $(PWD):/app -w /app $(DOCKER_IMAGE) ./$(PROJECT_NAME)

clean:
	rm -f $(PROJECT_NAME)
	rm -f $(PROJECT_NAME).o
	docker rmi $(DOCKER_IMAGE) 2>/dev/null || true
