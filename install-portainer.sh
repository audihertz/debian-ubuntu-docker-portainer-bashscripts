#!/bin/bash
#
# https://docs.portainer.io/start/install-ce/server/docker/linux 
#
sudo docker run -d \
  -p 8000:8000 \
  -p 9443:9443 \
  -e TZ=America/Los_Angeles \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /mnt/VOLUMES/_PORTAINER:/data \
  portainer/portainer-ce:latest 
#
