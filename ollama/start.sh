#!/bin/sh

# Wait until the Ollama service is ready
until curl -s http://localhost:11434/tags > /dev/null; do
  echo "Warte auf Ollama..."
  sleep 2
done

# Load model(s) automatically (e.g. mistral)
ollama run mistral
ollama run llama3

# Start the server in the foreground
exec ollama serve