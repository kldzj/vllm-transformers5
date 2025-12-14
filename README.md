# vLLM with Transformers 5

This repository provides a Docker image for [vLLM](https://github.com/vllm-project/vllm) with `transformers>=5.0.0rc0` pre-installed to support newer models.

## Usage

### Pulling the image

```bash
docker pull ghcr.io/kldzj/vllm-transformers5:latest
```

### Building locally

```bash
# Build with default vLLM version (v0.12.0)
docker build -t vllm-transformers5 .

# Build with a specific vLLM version
docker build --build-arg VLLM_VERSION=v0.12.1 -t vllm-transformers5 .
```
