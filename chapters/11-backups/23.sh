restic -r /mnt/backup-usb snapshots   # note the latest snapshot ID
restic -r /mnt/backup-usb ls <snapshot-id> | head    # list files
