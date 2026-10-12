docker pull ghcr.io/open-webui/open-webui:latest

docker run -d \
  --name open-webui \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v /srv/lab/data/open-webui:/app/backend/data \
  ghcr.io/open-webui/open-webui:latest
