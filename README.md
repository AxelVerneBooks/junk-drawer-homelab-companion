# The Junk Drawer Homelab — Companion Repo

![License: MIT](https://img.shields.io/badge/license-MIT-green)

**Free, MIT-licensed companion to [_The Junk Drawer Homelab_](https://axelverne.com/books/junk-drawer-homelab.html)** by Axel Verne — the book about turning the old Pi, the dead-battery laptop and the retired phone in your drawer into a lab that replaces subscriptions.

Nobody should type a compose file out of a paperback. Every code block in the book lives here, in chapter order, as a real file.

```
git clone https://github.com/AxelVerneBooks/junk-drawer-homelab-companion
cd junk-drawer-homelab-companion/chapters/04-pi-hole
```

Each chapter also has a copy page with one-click copy buttons: **axelverne.com/jd/N** (N = chapter number). The [Drawer Configurator](https://axelverne.com/jd/build) assembles a build order and merged compose for whatever you found in *your* drawer.

## Chapters

| # | Chapter | blocks |
|---|---|---|
|  1 | [Chapter 1 — What's in the Drawer](chapters/01-whats-in-the-drawer/) | 1 |
|  2 | [Chapter 2 — Subscription Killer](chapters/02-subscription-killer/) | 1 |
|  3 | [Chapter 3 — The Boring Foundation](chapters/03-the-boring-foundation/) | 7 |
|  4 | [Chapter 4 — First Light I: Pi-hole on the Pi You Forgot](chapters/04-pi-hole/) | 5 |
|  5 | [Chapter 5 — First Light II: Old Laptop → Jellyfin](chapters/05-jellyfin/) | 4 |
|  6 | [Chapter 6 — First Light III: Old Phone → Camera, Dashboard, or Sensor](chapters/06-old-phone/) | 3 |
|  7 | [Chapter 7 — Break Up With Big Tech I: Google Photos → Immich](chapters/07-immich/) | 9 |
|  8 | [Chapter 8 — Break Up With Big Tech II: Password Manager → Vaultwarden](chapters/08-vaultwarden/) | 6 |
|  9 | [Chapter 9 — Break Up With Big Tech III: Audiobooks & Podcasts → Audiobookshelf](chapters/09-audiobookshelf/) | 5 |
| 10 | [Chapter 10 — Fortress I: Reach It From Anywhere Without Opening a Port (Tailscale)](chapters/10-tailscale/) | 9 |
| 11 | [Chapter 11 — Fortress II: Backups That Actually Restore](chapters/11-backups/) | 27 |
| 12 | [Chapter 12 — Fortress III: Network Hygiene](chapters/12-network-hygiene/) | 13 |
| 13 | [Chapter 13 — The Oracle I: Local AI on Old Hardware](chapters/13-ollama/) | 23 |
| 14 | [Chapter 14 — The Oracle II: Let the AI Run the Lab](chapters/14-mcp-bridge/) | 6 |
| 15 | [Chapter 15 — The Oracle III: Automations with n8n](chapters/15-n8n/) | 4 |
| 16 | [Chapter 16 — The Rack: Many Boxes Into One](chapters/16-the-rack/) | 3 |
| 17 | [Chapter 17 — When It Breaks: The Field Guide](chapters/17-when-it-breaks/) | 5 |
| 18 | [Chapter 18 — Close the Drawer](chapters/18-close-the-drawer/) | 2 |

`blocks.json` is a machine-readable index of every block (chapter, section, language, file) — it powers the copy pages and the configurator.

## Rules of the house
- Secrets only in `.env` files, which are gitignored. Nothing here contains a real password or token.
- Blocks are copied verbatim from the manuscript; if the book and the repo disagree, open an issue and the repo wins (it's newer).
- Build-time notes marked `[BUILD TIME: ...]` in the book are measured on real hardware before release.

Part of [_The MCP Series_](https://axelverne.com): *MCP for Business*, *MCP for the Homelab*, *The Junk Drawer Homelab*.
