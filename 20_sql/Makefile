.PHONY: run

SRC_SQL := hello_xmas.sql

run:
	docker run --rm -v "$(PWD):/app" -w /app keinos/sqlite3 sh -c 'sqlite3 < $(SRC_SQL)'
