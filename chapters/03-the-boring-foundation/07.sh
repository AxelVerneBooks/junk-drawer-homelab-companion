sudo smartctl -H /dev/sda          # "PASSED" or not
sudo smartctl -A /dev/sda | grep -E "Reallocated|Pending|Uncorrect"
