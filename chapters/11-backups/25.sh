restic -r /mnt/backup-usb restore <snapshot-id> --target /tmp/test-restore
cat /tmp/test-restore/srv/lab/backup/immich-db.sql | head -20
