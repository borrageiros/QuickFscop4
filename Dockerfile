FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    gcc-mingw-w64 \
    nsis \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

COPY . .

RUN chmod +x build.sh

ARG BUILD_MODE=release

RUN ./build.sh ${BUILD_MODE}

