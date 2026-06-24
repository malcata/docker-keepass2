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
- `KEEPASS_FOLDER` - Path to folder containing the KeePass database file

Optional environment variables:
- `IMAGE_TAG` - Docker image tag (default: `latest`)
- `KEEPASS_VAULT` - KeePass database filename (default: `myvault.kdbx`)

## Architecture

- **Dockerfile**: Debian stable-slim based image that installs KeePass2 and sets it as the entrypoint
- **Makefile**: Build targets for different architectures and run configuration
- X11 forwarding: Container connects to the host X server (XQuartz) via `host.docker.internal:0`. Docker Desktop on macOS runs containers in a Linux VM so `--net=host` does not work; `host.docker.internal` is used instead.
