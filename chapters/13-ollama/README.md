# Chapter 13 — The Oracle I: Local AI on Old Hardware

Chapter 13 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/13

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build | Linux (GPU or CPU): |
| 02 | `02.sh` | The build | Raspberry Pi (CPU-only, slow): |
| 03 | `03.sh` | The build | Ollama is a single daemon. No Docker needed. If you prefer Docker, docker pull ollama/ollama exists, but the bare instal |
| 04 | `04.sh` | The build | Pull one: |
| 05 | `05.sh` | The build | This downloads the model (2–5 GB depending on quantization). First time takes a few minutes. |
| 06 | `06.sh` | The build | ### Step 3: Run the model locally |
| 07 | `07.txt` | The build | You'll see: |
| 08 | `08.sh` | The build | It worked. Try a longer prompt: |
| 09 | `09.sh` | The build | Ollama runs as a local service on port 11434. It's text-only by default. Open WebUI gives you a ChatGPT-like interface. |
| 10 | `10-compose.yml` | The build | Or, in Docker Compose at /srv/lab/compose/open-webui/compose.yaml: |
| 11 | `11.sh` | The build | On Linux, replace host.docker.internal with the Docker bridge IP: |
| 12 | `12.sh` | The build | Then: |
| 13 | `13-compose.yml` | The build | In Open WebUI, click the three-line menu → "Connections" → "Ollama." Set the URL to http://host.docker.internal:11434 (o |
| 14 | `14.txt` | The build | Open WebUI has a "Documents" section. Upload a PDF, text file, or markdown file. Then start a conversation with: |
| 15 | `15.sh` | When it breaks | "Connection refused" from Open WebUI to Ollama → The bridge IP is wrong. On Linux: |
| 16 | `16.sh` | When it breaks | Model is incredibly slow (1 token/second on GPU) → The model isn't offloading to the GPU. Run: |
| 17 | `17.sh` | When it breaks | Look for numgpulayers. If it's 0, the model isn't using GPU. Restart ollama with: |
| 18 | `18.sh` | When it breaks | Open WebUI won't start → Port 3000 is taken, or /srv/lab/data/open-webui doesn't exist. Check: |
| 19 | `19.sh` | When it breaks | Model generates garbage → Some models are weaker. Try a different one. Qwen, Llama, and Gemma are solid. Experiment with |
| 20 | `20.sh` | Make it good | Running multiple models: Ollama loads models into VRAM on demand. If you have 16 GB, you can run two 7B models, but they |
| 21 | `21-compose.yml` | Make it good | Or in compose.yaml: |
| 22 | `22.sh` | Make it good | Quantization: Models in ollama.com/library are pre-quantized (usually q40 or q4K). If you want better quality and have V |
| 23 | `23.sh` | Make it good | Or lower quality for speed: |
