# Download the latest binary for your hardware
# On a laptop or desktop:
wget https://github.com/simulot/immich-go/releases/download/v0.32.0/immich-go_Linux_x86_64.tar.gz
tar -xzf immich-go*.tar.gz
sudo mv immich-go /usr/local/bin/

# On a Raspberry Pi (ARM):
wget https://github.com/simulot/immich-go/releases/download/v0.32.0/immich-go_Linux_arm64.tar.gz
tar -xzf immich-go*.tar.gz
sudo mv immich-go /usr/local/bin/

immich-go --version    # should show v0.32.0 or later
