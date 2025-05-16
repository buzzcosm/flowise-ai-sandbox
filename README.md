# Local Flowise AI development environment

Flowise - [Env Variables](https://github.com/FlowiseAI/Flowise/blob/main/CONTRIBUTING.md#-env-variables⁠)

## Docker Compose

**Start Flowise**

```bash
docker-compose build ollama
docker-compose up -d
```

**Start Model in Ollama**

```bash
docker exec -it ollama ollama run mistral
```

**Open Flowise** 

[Flowise⁠](http://localhost:3000⁠) App

**Stop**

```bash
docker-compose down
// or
docker-compose down --remove-orphans -v
```

## 🔐 Qdrant with API-Key

🔹 In Flowise:
- URL: http://qdrant:6333
- API Key: mysecretapikey

### 🧪 Test

Host or Container

```bash
curl -H "api-key: mysecretapikey" http://localhost:6333/collections
```

In Flowise-Containers

```bash
docker exec -it flowise curl -H "api-key: mysecretapikey" http://qdrant:6333/collections
```

