# Chapter 7 — Break Up With Big Tech I: Google Photos → Immich

Chapter 07 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/7

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build — storage and server | Pick a device with space. A laptop works. A Raspberry Pi 4 works if you're okay waiting longer for searches. If you have |
| 02 | `02.sh` | The build — storage and server | Download the official compose files: |
| 03 | `03.sh` | The build — storage and server | Edit .env: |
| 04 | `04.txt` | The build — storage and server | Set these three things: |
| 05 | `05.sh` | The build — storage and server | Create the upload directory: |
| 06 | `06.sh` | The build — storage and server | Start Immich: |
| 07 | `07.sh` | The build — import from Google Takeout | Install immich-go, the tool that reassembles this correctly: |
| 08 | `08.sh` | The build — import from Google Takeout | Run the import: |
| 09 | `09.yml` | The machine-learning note | On a Raspberry Pi: disable it entirely. Edit docker-compose.yml, find the immich-machine-learning service, and change DI |
