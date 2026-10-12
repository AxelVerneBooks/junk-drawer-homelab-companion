docker compose up -d
docker compose exec authelia authelia crypto hash-password mypassword
docker compose down
