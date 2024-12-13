IMAGE_NAME := ada-tree-builder
IMAGE_TAG := latest
IMAGE := $(IMAGE_NAME):$(IMAGE_TAG)
WORKDIR := /app
CONTAINER_RUN := docker run --rm -v $(PWD):$(WORKDIR) -w $(WORKDIR)

MAIN := main
COMPILER := gnatmake
BUILD_ARTIFACTS := *.ali *.o $(MAIN)

.PHONY: all run clean image

all: image
	$(CONTAINER_RUN) $(IMAGE) $(COMPILER) $(MAIN).adb

run: all
	$(CONTAINER_RUN) $(IMAGE) ./$(MAIN)

clean:
	rm -f $(BUILD_ARTIFACTS)

image:
	@if ! docker images $(IMAGE_NAME) | grep $(IMAGE_TAG) > /dev/null; then \
		docker build -t $(IMAGE) .; \
	fi

clean-image:
	docker rmi $(IMAGE)
