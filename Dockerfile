ARG VLLM_VERSION=v0.12.0
FROM vllm/vllm-openai:${VLLM_VERSION}

RUN pip install --no-cache-dir --ignore-requires-python "transformers>=5.0.0rc0"
RUN python3 -c "import vllm; import transformers; print(f'vLLM version: {vllm.__version__}'); print(f'Transformers version: {transformers.__version__}')"

ENTRYPOINT ["vllm", "serve"]