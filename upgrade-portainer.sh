#!/bin/bash
#
# https://docs.portainer.io/start/upgrade/docker
#
# Exit on error
set -e
#
# SET VARIABLES
# -------------
# Storage location variable (leave blank for default Docker volume)
VOLUME_PATH=""
# -------------
#
# Stop and remove the existing Portainer container
docker stop portainer || true
docker rm portainer || true
#
# Pull the latest Portainer image
docker pull portainer/portainer-ce:latest
#
# Prepare the volume option based on the $VOLUME_PATH provided
if [ -z "$VOLUME_PATH" ]; then
    docker volume create portainer_data
    volume_option="-v portainer_data:/data"
else
    mkdir -p "$VOLUME_PATH"
    volume_option="-v $VOLUME_PATH:/data"
fi
#
# Run Portainer container
docker run -d \
    -p 9443:9443 \
    --name portainer \
    --restart=always \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $volume_option \
    portainer/portainer-ce:latest
#
# Check if the container is running
if docker container inspect portainer &> /dev/null; then
    echo "Portainer has been upgraded and is running."
else
    echo "Failed to upgrade or start Portainer."
fi
