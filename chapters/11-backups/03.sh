sudo mkfs.ext4 -L backup /dev/sdb1    # assuming one partition already exists
# Or, format the whole drive fresh:
# sudo parted /dev/sdb mklabel gpt
# sudo parted /dev/sdb mkpart primary ext4 1MiB 100%
# sudo mkfs.ext4 /dev/sdb1
