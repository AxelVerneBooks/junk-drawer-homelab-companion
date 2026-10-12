DOCKER_HOST=$(ip route | grep docker | awk '{print $3}')
# or hardcode it: usually 172.17.0.1
