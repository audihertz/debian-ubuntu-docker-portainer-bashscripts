#!/bin/bash
#
# https://docs.portainer.io/start/upgrade/docker 
#
# SET VARIABLES
timezone="America/Vancouver"
volume_path="/mnt/VOLUMES/_PORTAINER"
#
# STOP PORTAINER
sudo docker stop portainer \
#
# REMOVE PORTAINER
sudo docker rm portainer \
#
# PULL LATEST IMAGE OF PORTAINER
sudo docker pull portainer/portainer-ce:latest \
#
# START PORTAINER AGAIN
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
