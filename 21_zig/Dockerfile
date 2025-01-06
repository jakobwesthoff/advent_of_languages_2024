FROM alpine:latest

ARG ZIG_VERSION=0.13.0

RUN apk add --no-cache wget xz

RUN wget https://ziglang.org/download/${ZIG_VERSION}/zig-linux-x86_64-${ZIG_VERSION}.tar.xz \
    && tar -xf zig-linux-x86_64-${ZIG_VERSION}.tar.xz \
    && rm zig-linux-x86_64-${ZIG_VERSION}.tar.xz

ENV PATH=$PATH:/zig-linux-x86_64-${ZIG_VERSION}

WORKDIR /app
