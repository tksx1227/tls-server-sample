IMAGE_NAME := tls-sample-server
DOCKERFILE_PATH := docker/Dockerfile
CONTEXT_DIR := docker/
CONTAINER_NAME := tls-sample-server
HOST_PORT := 8080

.PHONY: all
all: docker/run

.PHONY: docker/build
docker/build:
	docker build -t ${IMAGE_NAME} -f ${DOCKERFILE_PATH} ${CONTEXT_DIR}

.PHONY: docker/run
docker/run:
	docker run --name ${CONTAINER_NAME} -p ${HOST_PORT}:80 -d ${IMAGE_NAME}

.PHONY: docker/stop
docker/stop:
	docker stop ${CONTAINER_NAME}

.PHONY: docker/start
docker/start:
	docker start ${CONTAINER_NAME}

.PHONY: docker/rm
docker/rm:
	docker rm ${CONTAINER_NAME}

.PHONY: docker/log
docker/log:
	docker logs -f ${CONTAINER_NAME}
