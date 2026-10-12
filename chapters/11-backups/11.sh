# Find the relative's Tailscale IP
tailscale list    # e.g., 100.x.x.x

# Create a restic repository pointing to their machine via SFTP
restic init -r 'sftp://user@100.x.x.x:/srv/lab/backup/remote-repo'
