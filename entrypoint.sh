#!/bin/bash
# 
# Script to update-build-run workspace for docker-compose services
# 
# Author: Emiliano J. Borghi Orue

# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters. Two are expected: ROS package and launchfile."
    echo "Eg: turtlesim turtlesim multisim.launch.py"
    exit -1
fi

# Arguments
PACKAGE_NAME=$1
LAUNCHFILE_NAME=$2

# Source ROS 2
. /opt/ros/foxy/setup.bash && \
# Retrieve new lists of packages
sudo apt-get update && \
# Install workspace dependencies
rosdep install --from-path /colcon_ws/src -yi --rosdistro=foxy && \
# Build workspace
colcon build --symlink-install && \
# Source workspace
. /colcon_ws/install/setup.bash && \
# Execute launchfile
ros2 launch $PACKAGE_NAME $LAUNCHFILE_NAME
