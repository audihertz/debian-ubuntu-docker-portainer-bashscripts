#!/bin/bash
#
# Exit on error
set -e
#
# Define timezone (change if needed)
TZ=${TZ:-America/Vancouver}
#
# Storage location variable (leave blank for default Docker volume)
STORAGE_LOCATION=""  # change this to your custom location or leave blank for default
#
# Prepare the volume option based on the storage location provided
if [ -z "$STORAGE_LOCATION" ]; then
    docker volume create portainer_data
    volume_option="-v portainer_data:/data"
else
    mkdir -p "$STORAGE_LOCATION"
    volume_option="-v $STORAGE_LOCATION:/data"
fi
#
# Run Portainer container
docker run -d \
    -p 9443:9443 \
    -e TZ=$TZ \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    $volume_option \
    portainer/portainer-ce:latest
#
# Check if the container is running
if docker container inspect portainer &> /dev/null; then
    echo "Portainer is running."
else
    echo "Failed to start Portainer."
fi
