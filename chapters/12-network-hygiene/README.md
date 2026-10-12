# Chapter 12 — Fortress III: Network Hygiene

Chapter 12 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/12

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | VLANs and guest Wi-Fi (the network layer) | Alternatively, install mDNS reflector on your main router: |
| 02 | `02.sh` | The build — Authelia path | ### Step 1: Create the Authelia compose |
| 03 | `03-compose.yml` | The build — Authelia path | Create compose.yaml: |
| 04 | `04.yml` | The build — Authelia path | Create /srv/lab/data/authelia/configuration.yml: |
| 05 | `05.yml` | The build — Authelia path | Create /srv/lab/data/authelia/usersdatabase.yml: |
| 06 | `06.sh` | The build — Authelia path | Generate password hashes: |
| 07 | `07.Caddyfile` | The build — Authelia path | Update your Caddy config (from Chapter 10 or create new at /srv/lab/data/caddy/Caddyfile): |
| 08 | `08.sh` | The build — Authelia path | Restart Caddy: |
| 09 | `09.sh` | The build — Authelia path | Start Authelia: |
| 10 | `10.sh` | The build — Authentik path (alternative) | If you prefer a fancier UI and group-based policies: |
| 11 | `11.sh` | The build — Authentik path (alternative) | Download the official docker-compose: |
| 12 | `12-.env` | The build — Authentik path (alternative) | Edit the .env file: |
| 13 | `13.sh` | The build — Authentik path (alternative) | Start it: |
