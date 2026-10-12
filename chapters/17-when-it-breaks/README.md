# Chapter 17 — When It Breaks: The Field Guide

Chapter 17 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/17

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The universal first three | Before anything else, from your main computer: |
| 02 | `02.sh` | "One app is down" — the container is unhappy | ## "One app is down" — the container is unhappy |
| 03 | `03.sh` | Disk full | ## Disk full |
| 04 | `04.json` | Disk full | Logs are eating the disk → sudo journalctl --vacuum-size=200M, and add to /etc/docker/daemon.json: |
| 05 | `05.sh` | Slow | Everything is sluggish, load average is high → htop. Sort by CPU. If it's Immich ML or a Jellyfin transcode, that's expe |
