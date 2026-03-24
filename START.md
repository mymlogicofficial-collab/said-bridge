# S.A.I.D. Bridge — Quick Start

## What this does
Sits between your NexusAI frontend and Ollama.
Frontend talks Socket.IO → Bridge → Ollama REST → back.
Zero API keys. Fully local. Sovereign.

## Setup (one time)
```
cd said-bridge
npm install
```

## Run (every time)
Open TWO terminals:

**Terminal 1 — Start the bridge:**
```
cd said-bridge
node bridge.js
```

**Terminal 2 — Start NexusAI frontend:**
```
cd nexusai-main
npm install
npm run dev
```

Then open the browser, hit **CONNECT** in the LocalEngineBar at the top of the chat panel.
Default port is **5055** — leave it as is.

## Change the model
Edit the top of `bridge.js`:
```js
const OLLAMA_MODEL = "gemma3:12b";  // ← change this to whatever model you have
```
Or set it as an env var:
```
OLLAMA_MODEL=llama3 node bridge.js
```

## Check what models you have
```
ollama list
```

## Health check
While bridge is running:
```
http://localhost:5055/health
```
Should return: `{"status":"ok","model":"gemma3:12b",...}`

## Troubleshooting
- **Connection error in frontend** → make sure bridge is running first
- **Bridge error: Ollama not running** → run `ollama serve` or open the Ollama app
- **Wrong model** → run `ollama list` to see what you have, update OLLAMA_MODEL
