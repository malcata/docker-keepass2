FROM debian:stable-slim

LABEL org.opencontainers.image.authors="malcata https://github.com/malcata"

# Install keepass2 with minimal dependencies and clean up in same layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends keepass2 && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/keepass2"]
