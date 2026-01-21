# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Docker container for running KeePass2 password manager with X11 display forwarding. Allows running KeePass2 GUI on macOS (and other systems) via an X server like XQuartz.

## Build Commands

```shell
# Build for ARM64 v8 (default, for Apple Silicon)
make build

# Build for AMD64
make build-amd

# Build for ARM64
make build-arm

# Build and publish multi-arch image to Docker Hub
make build-pub
```

## Run Command

```shell
make run
```

Required environment variables before running:
- `IP` - Host IP address (e.g., `export IP=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')`)
- `KEEPASS_FOLDER` - Path to folder containing the KeePass database file

Optional environment variables:
- `IMAGE_TAG` - Docker image tag (default: `latest`)
- `KEEPASS_VAULT` - KeePass database filename (default: `myvault.kdbx`)

## Architecture

- **Dockerfile**: Debian bullseye-slim based image that installs KeePass2 and sets it as the entrypoint
- **Makefile**: Build targets for different architectures and run configuration
- X11 forwarding: Container connects to host X server via `DISPLAY` environment variable and `/tmp/.X11-unix` volume mount
