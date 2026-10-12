# Spec — Junk Drawer Homelab: copy pages + Drawer Configurator

Owner: axelverne. Design: webdesigner. Deploy: godaddy (axelverne.com). Status: DRAFT 2026-10-12.

## Why
The book is a paperback/Kindle full of paste-ready code. Readers need a place to copy from, and the site needs a reason for buyers to show up (email capture → next book). Two static features, no backend, no accounts, no API costs.

## Data source
`blocks.json` at repo root (one entry per chapter; each block has `file`, `lang`, `section`, `context`, `lines`). Files under `chapters/NN-slug/`. Fetch raw from GitHub at build time or vendor a copy — never hand-maintain HTML copies of code.

## Feature 1 — Copy pages `axelverne.com/jd/N` (N = 1–18)
- `/jd` → index: book cover, one-line pitch, chapter list with block counts, "Buy" (Amazon/Gumroad) + email capture.
- `/jd/N` → chapter title, the "Copy, don't type" line, then every block in book order:
  - section header (from `section`), one-line context (from `context`), language badge
  - code block with **Copy** button (clipboard API, "Copied ✓" for 1.5 s) and **Raw** link to the GitHub file
  - per-chapter **Download all (.zip)** generated at build time
- Prev/next chapter nav; footer: "From *The Junk Drawer Homelab* by Axel Verne" + buy links.
- Print the URL exactly as in the book: `axelverne.com/jd/4` (no www, no trailing slash). 301 both forms.

## Feature 2 — Drawer Configurator `axelverne.com/jd/build`
Pure client-side. Reader ticks what they found; page emits a plan.

**Inputs (checkboxes/selects, one screen, no wizard):**
- Hardware: Raspberry Pi (model 2/3/4/5), old laptop (CPU: Intel ≥8th gen / older Intel / AMD / Apple Intel), old desktop (GPU: none / NVIDIA / AMD), Android phone, iPhone, external drive (size), USB enclosure, spare router/switch, NAS.
- Network: router model unknown / can set DHCP reservations / can do VLANs; ISP gives public IP? (yes/no/unknown)
- Goals (multi): block ads, movies & TV, photos off Google, passwords, audiobooks/podcasts, reach it from outside, backups, cameras, local AI, let AI run the lab, automations, cluster
- Hostnames/IPs (optional): lab subnet (default 192.168.1.0/24), Pi IP, laptop IP, timezone, `PUID/PGID`

**Outputs:**
1. **Build order** — ordered list of chapters to do, with "why this box" (e.g. "Pi 3 → Pi-hole (Ch 4): low power, always-on. Laptop w/ 8th-gen Intel → Jellyfin (Ch 5): Quick Sync"). Rule table lives in `configurator/rules.json` (I supply it).
2. **Merged files** — one `compose.yml` per host + one `.env` with the reader's values substituted into the chapter blocks (`${TZ}`, `${PUID}`, `${LAB_SUBNET}` etc.). Download as zip. Blocks are the repo files — no second copy of the code.
3. **AI prompt** — a prefilled paste-ready prompt: "I own: … I want: … I'm following *The Junk Drawer Homelab* chapters N, M. Walk me through Chapter N step by step and stop after each checkpoint." Copy button. (This is the "prompt provider.")
4. **Subscription Killer sheet** — CSV download prefilled with the subscriptions each chosen goal replaces, price column blank (house rule: reader fills their own numbers; we never print prices).

**Explicit non-goals:** hosted chat/LLM, logins, saving state server-side, telemetry beyond page views.

## Design
- Brand: violet #7c3aed, gold #f5c842, white A/V mark. Dark code blocks on light page. Mobile first — people read this on a phone next to a laptop.
- Must work with JS off for Feature 1 (code visible, copy buttons just absent). Feature 2 needs JS; show a "clone the repo instead" fallback.
- Fonts/system same as existing axelverne.com book pages.

## Build/deploy
- Static generator of webdesigner's choice (Astro/11ty/plain node script) that reads `blocks.json`; output drops into the existing axelverne.com site tree under `/jd/`. godaddy deploys. No new domain.
- Rebuild on repo push (GitHub Action → artifact) or manually by axelverne.

## Acceptance
- Every one of the 133 blocks reachable at `/jd/N` and byte-identical to the repo file.
- Configurator with "Pi 3 + Intel laptop + Android + 2 TB drive, goals: ads, movies, photos, remote" yields Ch 4 → 5 → 7 → 10 build order and two compose files that parse.
- Lighthouse mobile ≥ 90, no external JS except clipboard shim.
