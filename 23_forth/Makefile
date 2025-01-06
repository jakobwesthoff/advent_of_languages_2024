.PHONY: run shell

IMAGE_NAME := forthy42/gforth
FILE := hello_xmas.4th

run:
	docker run --rm -v $(PWD):/app --workdir=/app $(IMAGE_NAME) gforth $(FILE)

shell: 
	docker run --rm -it -v $(PWD):/app --workdir=/app $(IMAGE_NAME) /bin/sh

