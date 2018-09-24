.PHONY: help

APP_NAME ?= `grep 'app:' mix.exs | sed -e 's/\[//g' -e 's/ //g' -e 's/app://' -e 's/[:,]//g'`
APP_VSN ?= `grep 'version:' mix.exs | cut -d '"' -f2`
BUILD ?= `git rev-parse --short HEAD`

help:
		@echo "$(APP_NAME):$(APP_VSN)-$(BUILD)"
		@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the release into a Docker image
	docker build --build-arg APP_NAME=$(APP_NAME) \
		--build-arg APP_VSN=$(APP_VSN) \
		-t $(APP_NAME):$(APP_VSN)-$(BUILD) \
		-t $(APP_NAME):latest .

run: ## Run the app in Docker
	docker run --env-file config/docker.env \
		--expose 4000 -p 4000:4000 \
		--rm -it $(APP_NAME):latest

dev.build: ## Build the dev environment Docker image
	docker build \
		-t elixir-dev:latest \
		-f dev.Dockerfile .

dev.run: ## Run the dev environment in Docker
	docker run -p 4000:4000 \
		-v `pwd`:/app \
		--rm -it \
		elixir-dev:latest \
		iex -S mix phx.server

dev.go: ## Run the dev environment in Docker
	docker run -p 4000:4000 \
		-v `pwd`:/app \
		--rm -it \
        qldockersandboxdtr.mi.corp.rockfin.com/abellinson/elixir-dev:latest \
		iex -S mix phx.server
