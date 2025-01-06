.PHONY: run clean check-image

# Docker Image Name
IMAGE_NAME = xmas-tree-xslt

# Input files
INPUT_FILE = tree.xml
XSLT_FILE = hello_xmas.xslt

run: check-image $(INPUT_FILE) $(XSLT_FILE)
	docker run --rm -v $(PWD):/app $(IMAGE_NAME) xsltproc $(XSLT_FILE) $(INPUT_FILE)

# Check if docker image exists
check-image:
	@if ! docker images $(IMAGE_NAME) -q | grep -q .; then \
		echo "Building Docker image..."; \
		docker build -t $(IMAGE_NAME) .; \
	fi

clean:
	docker rmi $(IMAGE_NAME) || true
