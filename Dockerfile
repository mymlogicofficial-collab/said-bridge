# ── S.A.I.D. Bridge — Docker Image ───────────────────────────────────────────
# Runs the Socket.IO bridge that connects the SAID UI to Ollama.
# Ollama must be running on the HOST machine (not in Docker).
#
# Build:   docker build -t said-bridge .
# Run:     docker run -p 5055:5055 --add-host=host.docker.internal:host-gateway said-bridge
# ─────────────────────────────────────────────────────────────────────────────

FROM node:20-alpine

WORKDIR /app

# Install dependencies first (cache layer)
COPY package.json package-lock.json* ./
RUN npm install --omit=dev

# Copy bridge source
COPY bridge.js .

# Copy pre-built UI (run `npm run build` in said-ui first, output goes to said-ui/dist)
# If you don't have a dist/ folder yet, the bridge still works — just no frontend served
COPY dist/ ./dist/

# Default env — can be overridden at runtime
ENV BRIDGE_PORT=5055
ENV OLLAMA_HOST=host.docker.internal
ENV OLLAMA_PORT=11434
ENV OLLAMA_MODEL=gemma3:12b

EXPOSE 5055

CMD ["node", "bridge.js"]
