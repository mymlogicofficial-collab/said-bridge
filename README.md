# S.A.I.D. Bridge

Socket.IO bridge that connects the SAID UI frontend to a local Ollama instance.
One process. No API keys. Runs entirely on your machine.

---

## Quick Start (local, no Docker)

```bash
# 1. Install
npm install

# 2. Make sure Ollama is running
ollama serve

# 3. Start bridge
node bridge.js

# 4. Open http://localhost:5055
```

---

## Docker (Gordon setup)

### Step 1 — Build the UI first
```bash
git clone https://github.com/mymlogicofficial-collab/said-ui
cd said-ui
npm install
npm run build
cp -r dist ../said-bridge/dist
```

### Step 2 — Start the stack
```bash
cd said-bridge
docker-compose up --build
```

### Step 3 — Open browser
```
http://localhost:5055
```

---

## Environment Variables

| Variable | Default | Description |
|---|---|---|
| `BRIDGE_PORT` | `5055` | Port the bridge listens on |
| `OLLAMA_HOST` | `host.docker.internal` | Ollama host (use `127.0.0.1` if running locally outside Docker) |
| `OLLAMA_PORT` | `11434` | Ollama port |
| `OLLAMA_MODEL` | `gemma3:12b` | Default model (any installed Ollama model works) |

---

## Verify Ollama is running
```bash
curl http://localhost:11434/api/tags
```
Should return a JSON list of your installed models.

---

## Check bridge health
```bash
curl http://localhost:5055/health
# {"status":"ok","model":"gemma3:12b"}
```

---

## File Structure (Docker layout)
```
said-bridge/
  bridge.js
  package.json
  Dockerfile
  docker-compose.yml
  dist/           ← copied from said-ui/dist after npm run build
```

---

**MYM Logic LLC** — part of the S.A.I.D. ecosystem
