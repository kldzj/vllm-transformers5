ARG VLLM_VERSION=v0.12.0
FROM vllm/vllm-openai:${VLLM_VERSION}

RUN apt-get update && apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade git+https://github.com/huggingface/transformers.git

RUN python3 -c "import vllm; import transformers; print(f'vLLM version: {vllm.__version__}'); print(f'Transformers version: {transformers.__version__}')"

ENTRYPOINT ["vllm", "serve"]