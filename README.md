# create2_docker

Docker images to control a real iRobot Create 2 with ROS 2 and simulate it in Webots.

## Prerequisities

Install everything with the following script:

```bash
./setup_project.sh
```

- **Note**: It will require *sudo*.

## Real robot

### Build and run

```bash
docker-compose up --build hardware
```

## Simulation

### Bringup

```bash
docker-compose up --build webots_simulation
```

## Debugging

```bash
docker-compose run --rm dev [bash]
```

You can replace `[bash]` with any other command like [tmux].

## Getting started

To bring up more *services* (graphical tools, navigation, etc.) run:

```bash
docker-compose config --services
```

- **Tip**: You can run more than one *service* simultaneously appending their names:

```bash
docker-compose up hardware autonomy
```
