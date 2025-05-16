#!/bin/sh

# Warte, bis der Ollama-Dienst bereit ist
until curl -s http://localhost:11434/tags > /dev/null; do
  echo "Warte auf Ollama..."
  sleep 2
done

# Modell automatisch laden (z. B. mistral)
ollama run mistral
ollama run llama3

# Starte den Server im Vordergrund
exec ollama serve