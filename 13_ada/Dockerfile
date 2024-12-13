FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnat \
    gcc \
    make \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
