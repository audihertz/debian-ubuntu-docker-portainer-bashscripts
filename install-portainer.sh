#!/bin/bash
#
# https://docs.portainer.io/start/install-ce/server/docker/linux 
#
# SET VARIABLES
timezone="America/Vancouver"
volume_path="/mnt/volumes/portainer"
#
# START PORTAINER
sudo docker run -d \
  -p 9443:9443 \
  -e TZ="$timezone" \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$volume_path":/data \
  portainer/portainer-ce:latest 
#
# CHECK IF PORTAINER IS RUNNING
if sudo docker ps --filter "name=portainer" --format "{{.Names}}" | grep -q "portainer"; then
  echo "Portainer is running."
else
  echo "Portainer failed to start."
fi
#
