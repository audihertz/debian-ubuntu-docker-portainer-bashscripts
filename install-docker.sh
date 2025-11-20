#!/bin/bash
#
# Reference: https://docs.docker.com/engine/install/debian/
#
# Remove any old versions
sudo apt-get remove -y docker docker-engine docker.io containerd runc
#
# Update the package index
sudo apt-get update
#
# Install required packages
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
#
# Set up the Docker repository
sudo mkdir -p /etc/apt/keyrings
#
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#
# Update the package index
sudo apt-get update
#
# Install Docker Engine, CLI, and plugins
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#
# Add the current user to the Docker group
sudo usermod -aG docker $USER
#
# Test the installation
sudo docker run hello-world
#
# Check if the user has been added successfully
if groups $USER | grep -q 'docker'; then
    echo "User added to Docker group successfully."
else
    echo "Failed to add user to Docker group. Please add manually using: sudo usermod -aG docker $USER"
fi

echo "Please log out and log back in to apply group changes."
