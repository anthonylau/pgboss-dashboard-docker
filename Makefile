IMAGE_NAME := anthonylau/pgboss-dashboard
TAG := latest
PLATFORMS := linux/amd64,linux/arm64

.PHONY: build run stop

build:
	docker buildx build --platform $(PLATFORMS) -t $(IMAGE_NAME):$(TAG) -f container/Dockerfile .
