# create2_docker

Docker images to control a real iRobot Create 2 with ROS 2 and simulate it in Webots.

## Real robot

### Prerequisities

- `nvidia-container-toolkit`

- Create your workspace locally in `/home/$USER/colcon_ws`

### Installation

Please refer to [official site](https://docs.docker.com/compose/install/).

### Build and run

```bash
xhost +
docker-compose up --build hardware
```

## Simulation

### Bringup

```bash
xhost +
docker-compose up --build webots_simulation
```

### Debug

```bash
docker-compose run --rm webots_simulation [bash]
```

You can replace `[bash]` with any other command like [tmux].
