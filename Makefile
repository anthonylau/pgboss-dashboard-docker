IMAGE_NAME := anthonylau/pgboss-dashboard
TAG := latest

.PHONY: build run stop

build:
	docker build -t $(IMAGE_NAME):$(TAG) -f container/Dockerfile .
