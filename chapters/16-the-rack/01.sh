# If you have a second disk (/dev/sdb), partition and format it:
sudo fdisk /dev/sdb  # create a single partition
sudo mkfs.ext4 /dev/sdb1
sudo mkdir -p /srv/lab/shared
sudo mount /dev/sdb1 /srv/lab/shared
sudo chown -R nobody:nogroup /srv/lab/shared
# Edit /etc/fstab to make it permanent:
echo "/dev/sdb1 /srv/lab/shared ext4 defaults 0 0" | sudo tee -a /etc/fstab
