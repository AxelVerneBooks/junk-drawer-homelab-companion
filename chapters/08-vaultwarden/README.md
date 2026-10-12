# Chapter 8 — Break Up With Big Tech II: Password Manager → Vaultwarden

Chapter 08 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/8

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build | ## The build |
| 02 | `02-compose.yml` | The build | Create compose.yaml: |
| 03 | `03.sh` | The build | Generate an admin token. This is the password to the /admin page (where you manage users without signups): |
| 04 | `04.sh` | The build | It will ask for a password. Type something long and random. Copy the output (an Argon2 hash), and save it to a .env file |
| 05 | `05.txt` | The build | Then create the Caddyfile: |
| 06 | `06.sh` | The build | Start it: |
