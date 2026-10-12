RESTIC_PASSWORD_FILE=~/.restic-sftp-pass \
restic -r 'sftp://user@100.x.x.x:/srv/lab/backup/remote-repo' \
snapshots
