restic -r /mnt/backup-usb restore <snapshot-id> --target /tmp/test-restore
ls /tmp/test-restore/srv/lab/data/vaultwarden/
