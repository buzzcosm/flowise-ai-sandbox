#!/bin/bash

set -e

echo "📁 Create model folders..."
mkdir -p volumes/models/all-MiniLM-L6-v2

echo "⬇️ Download embedding model all-MiniLM-L6-v2 ..."
wget -q -O volumes/models/all-MiniLM-L6-v2/model.bin https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2/resolve/main/pytorch_model.bin
wget -q -O volumes/models/all-MiniLM-L6-v2/config.json https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2/raw/main/config.json
wget -q -O volumes/models/all-MiniLM-L6-v2/tokenizer.json https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2/raw/main/tokenizer.json

echo "🚀 Start containers with docker-compose..."
docker-compose up -d --build

echo "⏳ Wait for Ollama startup..."
until curl -s http://localhost:11434/tags >/dev/null; do
  sleep 2
done

echo "🧠 Download LLM (mistral) in Ollama..."
docker exec -it ollama ollama run mistral

echo "✅ Setup completed! Flowise can be reached at http://localhost:3000."
