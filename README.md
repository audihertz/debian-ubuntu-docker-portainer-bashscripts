# debian-ubuntu-bash-scripts
Various bash scripts for Ubuntu/Debian installs

## Script Descriptions
### install-docker.sh
Script to install needed system components for running a Docker environment on a local machine, downloading and starting Docker, and then running a simple "Hello World" test to confirm that Docker has been successfully installed.  Must be run with elevated privlidges:
```
sudo ./install-docker.sh
```
### install-portainer.sh
Script to install Portainer to a locally mapped volume and allow for management of Docker installs via web GUI via HTTPS on port 9443. Must be run with elevated privlidges:
```
sudo ./install-portainer.sh
```
### upgrade-portainer.sh
Script to automatically upgrade Portainer using the same parameters as defined in the "install-portainer.sh" script. This will stop the Docker instance, remove it, pull the most recent Docker image, and start Portainer again. Must be run with elevated privlidges:
```
sudo ./upgrade-portainer.sh
```
