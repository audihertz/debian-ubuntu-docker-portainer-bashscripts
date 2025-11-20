#!/bin/bash
#
# Exit on error
set -e
#
# SET VARIABLES
# -------------
# Timezone (change if needed)
TZ=${TZ:-Etc/UTC}
# Storage location variable (leave blank for default Docker volume)
VOLUME_PATH=""
# -------------
#
# Prepare the volume option based on the storage location provided
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
