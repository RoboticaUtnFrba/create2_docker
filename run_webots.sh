#!/bin/bash
xhost +local:root

# The script executes the command received as argument

docker run -it --rm \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --workdir="/home/create2/colcon_ws" \
  --volume="/home/$USER/colcon_ws:/home/create2/colcon_ws/src" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --device="/dev/snd" \
  --group-add="audio" \
  --gpus="all" \
  --network="host" \
  create2/webots $@

xhost -local:root
