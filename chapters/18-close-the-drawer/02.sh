# on each box
sudo apt update && sudo apt upgrade -y
cd /srv/lab/compose && for d in */; do (cd "$d" && docker compose pull -q && docker compose up -d); done
docker system prune -af --volumes=false
sudo smartctl -H /dev/sda
restic -r <your-repo> snapshots --latest 1    # did last night's backup happen?
