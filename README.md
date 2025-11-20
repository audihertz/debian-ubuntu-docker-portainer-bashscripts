# Debian/Ubuntu Bash Scripts for Docker and Portainer
These are a collection of bash scripts for setting up Docker and Portainer on Debian-based systems. I actively use these on Ubuntu, Debian ([openmediavault](https://github.com/openmediavault/openmediavault)), and Raspberry Pi (64-bit) OS installs for quick and easy setup and maintenance. 

## Script Descriptions
### [install-docker.sh](install-docker.sh)
Script to install needed system components for running a Docker environment on a local machine, downloading and starting Docker, and then running a simple "Hello World" test to confirm that Docker has been successfully installed. Once Docker is installed, it can be upgraded through standard system updates. This script must be changed to an executable and run with elevated privlidges:
```
sudo chmod +x install-docker.sh
sudo ./install-docker.sh
```
### [install-portainer.sh](install-portainer.sh)
Script to pull and start Portainer for a brand new installation with a variable option for locally mapped volume and allow for management of Docker installs via web GUI via HTTPS on port 9443 and verifies if Portainer is running or failed to start. The variable for a locally mapped install can be left blank ("") to use Docker's default storage location:
```
$VOLUME_PATH
```
This script must be changed to an executable but can be run as the non-root user that ran the Docker install script and has "docker" group permissions:
```
sudo chmod +x install-portainer.sh
./install-portainer.sh
```
### [upgrade-portainer.sh](upgrade-portainer.sh)
Script to automate upgrading Portainer using the same parameters as defined in the "install-portainer.sh" script. This will stop the Docker instance of Portainer, remove Portainer, pull the updated image if one is available, start Portainer again, and then verifies if Portainer is running or failed to start. This script also has the variable for a locally mapped install can be left blank ("") to use Docker's default storage location and should be updated if you changed the path in the install script: 
```
$VOLUME_PATH
```
This script must be changed to an executable but can be run as the non-root user that ran the Docker install script and has "docker" group permissions:
```
sudo chmod +x upgrade-portainer.sh
./upgrade-portainer.sh
```
