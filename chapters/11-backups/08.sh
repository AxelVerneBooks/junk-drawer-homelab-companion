# Immich (requires credentials from compose file)
docker compose -f /srv/lab/compose/immich/compose.yaml exec -T immich-server python3 -m immich dump_infra > /srv/lab/backup/immich-db.sql

# Vaultwarden (uses SQLite, just copy it)
cp /srv/lab/data/vaultwarden/db.sqlite3 /srv/lab/backup/vaultwarden-db.sqlite3

# Jellyfin (uses SQLite, same)
cp /srv/lab/data/jellyfin/jellyfin.db /srv/lab/backup/jellyfin-db.sqlite3

# Audiobookshelf (uses SQLite)
cp /srv/lab/data/audiobookshelf/database.sqlite3 /srv/lab/backup/abs-db.sqlite3
