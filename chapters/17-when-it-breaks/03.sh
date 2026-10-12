df -h                              # which filesystem
sudo du -xh --max-depth=2 /srv/lab | sort -h | tail -20   # what's big
docker system df                   # how much is Docker's
