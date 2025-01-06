FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libxslt1-dev \
    xsltproc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
