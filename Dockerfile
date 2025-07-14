ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:latest
FROM $BUILD_FROM

ENV LANG C.UTF-8
ENV EVCC_REPO=https://github.com/dsluschz/DSEVCCAWB.git
ENV EVCC_BRANCH=main

# Abhängigkeiten installieren
RUN apk add --no-cache \
    git \
    make \
    curl \
    go \
    yarn \
    nodejs \
    npm \
    bash \
    gcc \
    g++ \
    libc-dev \
    linux-headers

# evcc klonen und bauen
RUN git clone --branch ${EVCC_BRANCH} ${EVCC_REPO} /build \
    && cd /build \
    && make install