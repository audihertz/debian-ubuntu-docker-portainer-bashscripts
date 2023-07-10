# Debian/Ubuntu Bash Scripts for Docker and Portainer
These are a collection of scripts for setting up Docker and Portainer on Debian/Ubuntu systems. 

## Script Descriptions
### [install-docker.sh](install-docker.sh)
Script to install needed system components for running a Docker environment on a local machine, downloading and starting Docker, and then running a simple "Hello World" test to confirm that Docker has been successfully installed.  Must be changed to an executable and run with elevated privlidges:
```
sudo chmod +x install-docker.sh
sudo ./install-docker.sh
```
### [install-portainer.sh](install-portainer.sh)
Script to install Portainer to a locally mapped volume and allow for management of Docker installs via web GUI via HTTPS on port 9443 with two variables defined that can be changed to match your install:
```
$timezone
$volume_path
```
This script must be changed to an executable and be run with elevated privlidges:
```
sudo chmod +x install-portainer.sh
sudo ./install-portainer.sh
```
### [upgrade-portainer.sh](upgrade-portainer.sh)
Script to automatically upgrade Portainer using the same parameters as defined in the "install-portainer.sh" script. This will stop the Docker instance, remove it, pull the most recent Docker image, and start Portainer again with two variables defined that can be changed to match your install:
```
$timezone
$volume_path
```
This script must be changed to an executable and be run with elevated privlidges:
```
sudo chmod +x upgrade-portainer.sh
sudo ./upgrade-portainer.sh
```
