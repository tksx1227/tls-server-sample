IMAGE_NAME := tls-sample-server
DOCKERFILE_PATH := docker/Dockerfile
CONTEXT_DIR := docker/
CONTAINER_NAME := tls-sample-server
HOST_HTTP_PORT := 8080
HOST_HTTPS_PORT := 8443

NUMBITS := 4096
PRIVATE_KEY_PATH := docker/keys/private.pem
PUBLIC_KEY_PATH := docker/keys/public.pem
CERTIFICATION_PATH := docker/keys/server.crt
CERTIFICATION_CONFIG_PATH := docker/keys/crt.conf

.PHONY: all
all: docker/run

.PHONY: docker/build
docker/build:
	docker build -t ${IMAGE_NAME} -f ${DOCKERFILE_PATH} ${CONTEXT_DIR}

.PHONY: docker/run
docker/run:
	docker run --name ${CONTAINER_NAME} -p ${HOST_HTTPS_PORT}:443 -p ${HOST_HTTP_PORT}:80 -d ${IMAGE_NAME}

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

.PHONY: openssl/private
openssl/private:
	openssl genrsa -out ${PRIVATE_KEY_PATH} ${NUMBITS}

.PHONY: openssl/public
openssl/public:
	openssl rsa -in ${PRIVATE_KEY_PATH} -out ${PUBLIC_KEY_PATH} -outform PEM -pubout

.PHONY: openssl/crt
openssl/crt:
	openssl req -new -x509 -key ${PRIVATE_KEY_PATH} -out ${CERTIFICATION_PATH} -days 365 -outform PEM -config ${CERTIFICATION_CONFIG_PATH}
