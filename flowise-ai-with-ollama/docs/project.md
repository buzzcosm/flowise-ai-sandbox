# 🧠 Local Flowise AI Development Environment with Docker Compose

> ⚠️ This setup is intended for **macOS** or **Linux** users. Windows support is not included.

This project provides a fully **local development environment** for [Flowise AI](https://flowiseai.com), including a local **LLM (Ollama)**, a **vector database (Qdrant)**, and a **local embedding server** – all managed via `docker-compose`.

---

## 📦 Components

| Component        | Purpose                                 | Port           |
| ---------------- | --------------------------------------- | -------------- |
| Flowise          | UI for building LLM-based flows         | `3000`         |
| Qdrant           | Vector database for document embeddings | `6333`, `6334` |
| Ollama           | Local LLM server (Mistral, etc.)        | `11434`        |
| Embedding Server | Embedding model API (OpenAI compatible) | `8080`         |

---

## 🚀 Quick Start

### 1. 🔧 Prerequisites

* Docker & Docker Compose installed
* Optional: NVIDIA GPU + [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)

### 2. 📂 Start the project

```bash
git clone <REPO_URL>
cd <REPO_DIRECTORY>
chmod +x start.sh
./start.sh
```

### 3. 🧠 Load LLM model in Ollama

The `start.sh` script automatically runs:

```bash
docker exec -it ollama ollama run mistral
```

### 4. 📥 Download embedding model (all-MiniLM-L6-v2)

The `start.sh` script will also fetch the following into `./volumes/models/all-MiniLM-L6-v2/`:

* `model.bin`
* `config.json`
* `tokenizer.json`

Alternatively, use any compatible [LocalAI embedding model](https://localai.io/basics/models/).

### 5. 🌐 Open Flowise UI

👉 [http://localhost:3000](http://localhost:3000)

### 6. ⚙️ Configure Flowise

#### 🔧 Add Ollama as LLM Provider:

1. Click the **Settings** (gear icon) in the top right corner
2. Select **LLMs** or **LLM Providers** from the sidebar
3. Click **Add New LLM**

**Settings:**

* **LLM Name:** `Ollama (Mistral)` (or your choice)
* **Provider:** `Ollama`
* **Model Name:** `mistral` (or `llama3`, `gemma`, etc.)
* **Base URL:** `http://ollama:11434`
* **Temperature:** `0.7`
* **Max Tokens:** `500`

> ⚠️ Make sure the model has been loaded via `ollama run mistral`

#### 📡 Add Qdrant as Vector DB:

* **Type:** `Qdrant`
* **URL:** `http://qdrant:6333`

> ℹ️ If you're using this Docker-based setup, the hostname `qdrant` is automatically resolvable from within the Flowise container. No manual `/etc/hosts` entries are required.

##### 🔐 Qdrant with API-Key

🔹 In Flowise:
- URL: http://qdrant:6333
- API Key: mysecretapikey

###### 🧪 Test

Host or Container

```bash
curl -H "api-key: mysecretapikey" http://localhost:6333/collections
```

In Flowise-Containers

```bash
docker exec -it flowise curl -H "api-key: mysecretapikey" http://qdrant:6333/collections
```

#### 📡 Add Embedding Provider:

* **Type:** `OpenAI Embeddings`
* **Base URL:** `http://embedding:8080/v1`
* **Model Name:** `all-MiniLM-L6-v2`
* **API Key:** leave empty or use a dummy string

### 7. 🧪 Example Flow Structure

1. Input Node (user query)
2. Retriever Node (Qdrant)
3. Embedding Node (OpenAI-compatible)
4. LLM Node (Ollama)
5. Output Node (chat response)

---

## 🔍 Expansion Ideas

* Load your own PDFs or websites
* Customize embedding models (`nomic-embed-text`, `sentence-transformers`, etc.)
* Add more local models to Ollama (`llama3`, `gemma`, ...)

---

## 🧹 Stop services

```bash
docker-compose down
```

## 📁 Persistent Data

* `./volumes/flowise_data/`
* `./volumes/qdrant_storage/`
* `./volumes/ollama_data/`
* `./volumes/models/`

---

## 🛠️ docker-compose.yml Summary

The following services are started with persistent volumes and networking:

### Embedding Service with AMD64 Emulation (Apple Silicon)

If you're using a Mac with M1/M2/M3, use the following service definition to run the embedding server:

```yaml
embedding:
  image: localai/localai:latest
  platform: linux/amd64
  ports:
    - "8080:8080"
  volumes:
    - ./volumes/models:/models
  environment:
    - MODELS_PATH=/models
    - LOCALAI_MODEL=all-MiniLM-L6-v2
    - BACKEND=sentence-transformers
  restart: unless-stopped
```

> ⚠️ This uses architecture emulation to run x86\_64 images on Apple Silicon (slower but convenient).

---

Happy experimenting with your local AI environment! 🧪✨
