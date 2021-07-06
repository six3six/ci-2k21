NAME=CI-2K21
VERSION=0.0.1

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

RELEASE_PACKAGE:=ghcr.io/six3six/ci-2k21

DOCKER_ARGS:= -p 8080:80

.PHONY: run
run: build
	@docker run $(DOCKER_ARGS) --name $(NAME) --rm $(RELEASE_PACKAGE)

.PHONY: build
build:
	@docker build . -t  $(RELEASE_PACKAGE)

.PHONY: build-cross
build-cross:
	@docker buildx create --use
	@docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 . -t $(RELEASE_PACKAGE) --push

.PHONY: docker-dev-image
docker-dev-image:
	@docker build -t $(RELEASE_PACKAGE)_dev - < dev.Dockerfile

.PHONY: help
all: help
# help: show this help message
help: Makefile
	@echo
	@echo " Choose a command to run in "$(APP_NAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo