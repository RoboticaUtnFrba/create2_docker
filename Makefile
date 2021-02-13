.PHONY: create2_docker
create2_docker:
	docker build \
      -f Dockerfile.Webots \
      --build-arg UID=$(shell id -u) \
      -t create2/webots .
