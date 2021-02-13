# create2_docker

Docker images to control a real iRobot Create 2 with ROS 2 and simulate it in Webots.

## Real robot

### Prerequisities

- `nvidia-container-toolkit`

### Installation

Please refer to [official site](https://docs.docker.com/compose/install/).

### Build and run

```bash
xhost +
docker-compose up --build hardware
```

## Simulation

### Build

```bash
make create2_webots
```

### Run

```bash
./run_webots.sh [webots]
```

You can replace `[webots]` with any other command.
