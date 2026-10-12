# Chapter 4 — First Light I: Pi-hole on the Pi You Forgot

Chapter 04 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/4

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build — Docker path (Pi 3 and up, or any laptop) | ## The build — Docker path (Pi 3 and up, or any laptop) |
| 02 | `02-compose.yml` | The build — Docker path (Pi 3 and up, or any laptop) | Create compose.yaml: |
| 03 | `03.sh` | The build — Docker path (Pi 3 and up, or any laptop) | Before starting it, free up port 53 — Ubuntu and newer Raspberry Pi OS run a local DNS stub that squats on it: |
| 04 | `04.sh` | The build — Docker path (Pi 3 and up, or any laptop) | Then: |
| 05 | `05.sh` | The build — bare-metal path (Pi 1, Pi 2, original Zero, or "I don't want Docker on this") | Pi-hole's own installer is excellent and this is the path I'd actually use on the oldest boards: |
