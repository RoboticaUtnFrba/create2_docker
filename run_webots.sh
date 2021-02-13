#!/bin/bash
xhost +local:root

# The script executes the command received as argument

docker run -it --rm \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --workdir="/home/$USER" \
  --volume="/home/$USER:/home/$USER" \
  --volume="/etc/group:/etc/group:ro" \
  --volume="/etc/passwd:/etc/passwd:ro" \
  --volume="/etc/shadow:/etc/shadow:ro" \
  --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
  --device "/dev/snd" \
  --group-add audio \
  --gpus=all \
  --network=host \
  create2/webots $@

xhost -local:root
