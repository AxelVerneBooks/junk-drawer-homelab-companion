# 1. Update everything
sudo apt update && sudo apt upgrade -y

# 2. The tools you'll miss when they're not there
sudo apt install -y curl git htop smartmontools ufw unattended-upgrades

# 3. Automatic security updates (set and forget)
sudo dpkg-reconfigure -plow unattended-upgrades   # answer Yes

# 4. Firewall: allow SSH, block everything else by default
sudo ufw allow OpenSSH
sudo ufw --force enable

# 5. Docker, the official way
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER
newgrp docker                                       # or log out and back in

# 6. The one folder layout every chapter uses
sudo mkdir -p /srv/lab
sudo chown -R $USER:$USER /srv/lab
mkdir -p /srv/lab/{compose,data,media,backup}
