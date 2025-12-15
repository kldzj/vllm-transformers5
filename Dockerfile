ARG VLLM_VERSION=v0.12.0
FROM vllm/vllm-openai:${VLLM_VERSION}

RUN apt-get update && apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN uv pip install --system --upgrade "transformers>=5.0.0rc0" "numpy>=2.0.0,<2.3.0"
RUN python3 -c "import vllm; import transformers; print(f'vLLM version: {vllm.__version__}'); print(f'Transformers version: {transformers.__version__}')"

RUN sudo ln -s /usr/local/cuda/targets/x86_64-linux/lib/stubs/libcuda.so /usr/lib64/libcuda.so || \
    echo "WARNING: Failed to create libcuda.so symlink. This may cause issues if CUDA stubs are required."

ENTRYPOINT ["vllm", "serve"]