IMAGE_NAME=pe
CONTAINER_NAME=pe

build:
	docker build -t "${IMAGE_NAME}" --platform linux/arm64/v8 .

run:
	docker run --rm --name "${CONTAINER_NAME}" -p 8080:80 "${IMAGE_NAME}"

all: build run

exec:
	docker exec -it "${CONTAINER_NAME}" /bin/bash
