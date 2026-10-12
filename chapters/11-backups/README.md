# Chapter 11 — Fortress II: Backups That Actually Restore

Chapter 11 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/11

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build | On the primary lab machine: |
| 02 | `02.sh` | The build | Plug in the USB drive. Find it: |
| 03 | `03.sh` | The build | Let's say it's /dev/sdb. Wipe it completely: |
| 04 | `04.sh` | The build | Mount it: |
| 05 | `05.sh` | The build | ### Step 3: Initialize a restic repository on the USB drive |
| 06 | `06.sh` | The build | ### Step 4: Back up /srv/lab/data to USB |
| 07 | `07.sh` | The build | This is a dry run the first time. Restic will scan, compress, and encrypt everything in /srv/lab/data. Watch the progres |
| 08 | `08.sh` | The build | Before backing up, dump the databases: |
| 09 | `09.sh` | The build | Then back up /srv/lab/backup too: |
| 10 | `10.sh` | The build | On the remote machine (Pi or laptop at your relative's house, also on Tailscale), initialize a second restic repository: |
| 11 | `11.sh` | The build | From your primary lab machine, over Tailscale: |
| 12 | `12.sh` | The build | Restic will ask for the SSH password (the relative's machine password). Store this in an environment variable or a passw |
| 13 | `13.sh` | The build | Then backup over the network: |
| 14 | `14.sh` | The build | Sign up for a Backblaze B2 account. Create an API key and a bucket for backups. Restic talks to B2 as if it's S3: |
| 15 | `15.sh` | The build | Then: |
| 16 | `16.ini` | The build | Create /etc/systemd/system/lab-backup.service: |
| 17 | `17.ini` | The build | Create /etc/systemd/system/lab-backup.timer: |
| 18 | `18.sh` | The build | Enable it: |
| 19 | `19.sh` | The build | Check the logs: |
| 20 | `20.sh` | Make it good | Prune old snapshots: After a year, your repository is gigabytes of old snapshots. Restic can delete old backups: |
| 21 | `21.sh` | When it breaks | USB unmounts between backups → Mount points are temporary. Use /etc/fstab to make it permanent: |
| 22 | `22.sh` | When it breaks | Backup suddenly takes 3 hours → USB drive is degrading. Check SMART: |
| 23 | `23.sh` | Restore drill (mandatory) | The USB is plugged in and mounted. Pick a file from /srv/lab/data — let's say a Vaultwarden password: |
| 24 | `24.sh` | Restore drill (mandatory) | Now restore: |
| 25 | `25.sh` | Restore drill (mandatory) | You dumped the Immich database to /srv/lab/backup/immich-db.sql. Restore it: |
| 26 | `26.sh` | Restore drill (mandatory) | Now do the same from the remote backup (over Tailscale): |
| 27 | `27.sh` | Restore drill (mandatory) | And the cloud backup: |
