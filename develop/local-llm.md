# Local LLM

This document explains how to use local LLM for development.

Warning: use this article at your own risk. Always back up your data before making significant changes to your system.

-------------------------------------------------------------------------------

## Contents

- [AI Tools](#ai-tools)
  - [Model Sources](#model-sources)
  - [Model Analysis Table](#model-analysis-table)

-------------------------------------------------------------------------------


## AI Tools

| Application | Description |
|-------------|-------------|
| [LLaMA.cpp](https://github.com/ggml-org/llama.cpp) | LLM inference in C/C++ |
| [lmstudio](https://lmstudio.ai/home) | Run local LLMs like `gpt-oss`, `Qwen3`, `Gemma3`, `DeepSeek` and many more on your computer, privately and for free. |
| [ollama](https://ollama.com/) | Chat with and deploy open-source models locally. |


* **note**: LM Studio uses LLaMA.cpp under the hood for running GGUF models.


### Model Sources
| Application | Description |
|-------------|-------------|
| [Ollama models](https://ollama.com/search) | Search for and download open-source models. |
| [Hugging Face](https://huggingface.co/datasets) | Free GGUF models |


## Model Analysis Table (for Macbook Pro M4 32GB)

| Model | Link | **Size (est.)** | **RAM** | **Speed** | **Coding Fit** | **M4 32GB** | **Suggested Usage** | **Action** |
|-------|------|-----------------|--------------|-----------|----------------|-------------|---------------------|------------|
| **qwen2.5-coder-1.5b-instruct** | [qwen2.5-coder-1.5b-instruct](https://huggingface.co/Qwen/qwen2.5-coder-1.5b-instruct) | **1.6GB** | **2GB** | **100+ t/s** | ⭐ **Autocomplete** | ✅ Perfect | **Tab ghost-text** (Python/TS lines) | **KEEP** ⭐ |
| **deepseek-coder-v2-lite-instruct** | [deepseek-coder-v2-lite-instruct](https://huggingface.co/deepseek-ai/deepseek-coder-v2-lite-instruct) | **9GB** | **12GB** | **35-45 t/s** | ⭐ **Refactor king** | ✅ Perfect | **React hooks/TS types/debug** | **KEEP** ⭐ |
| **qwen3-coder-30b-a3b-instruct** | [Qwen/Qwen3-Coder-30B-A3B-Instruct](https://huggingface.co/Qwen/Qwen3-Coder-30B-A3B-Instruct) | **17GB** | **22GB** | **18-25 t/s** | ⭐ **Agent leader** | ✅ Perfect | **Multi-file agents/planning** | **KEEP** ⭐ |
| **openai/gpt-oss-20b** | [openai/gpt-oss-20b](https://huggingface.co/openai/gpt-oss-20b) | **12GB** | **16GB** | **25-35 t/s** | ✅ **General code** | ✅ Fits | **Mid-weight chat** | **KEEP** (backup) |
| **qwen/qwen3-4b-thinking-2507** | [Qwen/Qwen3-4B-Thinking-2507](https://huggingface.co/Qwen/Qwen3-4B-Thinking-2507) |**3GB** | **4GB** | **60+ t/s** | ⚠️ **Reasoning** | ✅ Fits | **Light chat** (backup autocomplete) | **OPTIONAL** |


### LLaMA.cpp run command example:

```bash
# run gpt-oss-20b model in CLI interactive mode
llama-cli -m ~/models/lmstudio-community/gpt-oss-20b-GGUF/gpt-oss-20b-MXFP4.gguf --interactive
# or run the model using the llama-server - server at 127.0.0.1:8080
llama-server -m ~/models/lmstudio-community/gpt-oss-20b-GGUF/gpt-oss-20b-MXFP4.gguf
```