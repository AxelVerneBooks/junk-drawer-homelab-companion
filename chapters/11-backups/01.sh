curl -sL https://github.com/restic/restic/releases/download/v0.17.3/restic_0.17.3_linux_amd64.bz2 | bzip2 -d > /tmp/restic
sudo mv /tmp/restic /usr/local/bin/restic
sudo chmod +x /usr/local/bin/restic
restic version
