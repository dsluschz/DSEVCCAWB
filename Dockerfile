ARG BUILD_FROM=ghcr.io/home-assistant/armv7-base:latest
FROM ${BUILD_FROM}

# Install build dependencies
RUN apk add --no-cache go git make bash curl

# Set env vars
ENV GO111MODULE=on
ENV EVCC_REPO=https://github.com/dsluschz/DSEVCCAWB.git
ENV EVCC_BRANCH=main

# Clone and build
RUN git clone --branch ${EVCC_BRANCH} ${EVCC_REPO} /build \
    && cd /build \
    && go build -o /usr/bin/evcc .

# Add run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]