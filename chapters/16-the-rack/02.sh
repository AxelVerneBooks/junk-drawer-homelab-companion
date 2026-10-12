sudo apt-get install nfs-kernel-server
# Edit /etc/exports:
echo "/srv/lab/shared 192.168.1.0/24(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
