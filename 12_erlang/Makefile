BEAM_DIR = ./ebin
ERLC="erlc"
ERL="erl"
DOCKER_IMAGE="erlang:25-alpine"

SRC="tree.erl"

all: compile

# Create output directory and compile using Docker
compile:
	@mkdir -p $(BEAM_DIR)
	@docker run --rm -v "$(PWD):/app" -w /app $(DOCKER_IMAGE) \
		$(ERLC) -o $(BEAM_DIR) $(SRC)

run: compile
	@docker run --rm -v "$(PWD):/app" -w /app $(DOCKER_IMAGE) \
		$(ERL) -noshell -pa $(BEAM_DIR) -eval "tree:draw(), init:stop()"

clean:
	@rm -rf $(BEAM_DIR)

.PHONY: all compile run clean help
