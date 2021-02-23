#!/bin/bash
#
# Usage: ./setup_project.sh (it requires sudo!)
#
# Author: Emiliano J. Borghi Orue (eborghiorue@frba.utn.edu.ar)
#

# Install some dependencies
sudo apt-get update;
sudo apt-get install -qq curl dirmngr git software-properties-common;

# Use GitHub CLI (gh)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -qq gh
echo "gh installed correctly"

# Autocomplete with gh
echo "eval \"$(gh completion -s bash)\"" >> /home/$USER/.bash_profile

# Login to GitHub
echo "Logging into GitHub"
gh auth login --web

# Add SSH key
KEY_FILE="/home/$USER/.ssh/robotica_utn_frba"
ssh-keygen -b 2048 -t rsa -f $KEY_FILE -q -N ""
sudo apt-get install -qq xclip;
# Copies the contents of the id_ed25519.pub file to your clipboard
xclip -selection clipboard < ${KEY_FILE}.pub
gh ssh-key add $KEY_FILE --title="Robotica UTN FRBA"
echo "New SSH key added to GitHub"

# Install other dependencies too
## docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Dependencies were installed"

# Install nvidia-container-toolkit
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list > /etc/apt/sources.list.d/nvidia-docker.list
sudo apt update
sudo apt -y install nvidia-container-toolkit
sudo systemctl restart docker

# Create workspace
WS_SRC_DIR="/home/$USER/colcon_ws/src"
mkdir -p $WS_SRC_DIR
cd $WS_SRC_DIR

# Fork and clone packages
echo "Setting up workspace in /home/$USER/colcon_ws"
PACKAGES=()
PACKAGES+=( "create2_autonomy" )
PACKAGES+=( "create2_description" )
PACKAGES+=( "create2_hardware" )
PACKAGES+=( "create2_utilities" )
PACKAGES+=( "libcreate" )
PACKAGES+=( "webots_ros2" )
for PACKAGE in ${PACKAGES[@]};
do
	gh repo fork --clone=true --remote=true RoboticaUtnFrba/${PACKAGE}
done
