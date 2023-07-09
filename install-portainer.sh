#!/bin/bash
#
# https://docs.portainer.io/start/install-ce/server/docker/linux 
#
# SET VARIABLES
timezone="America/Vancouver"
volume_path="/mnt/VOLUMES/_PORTAINER"
#
# START PORTAINER
sudo docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  -e TZ="$timezone" \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$volume_path":/data \
  portainer/portainer-ce:latest 
#
