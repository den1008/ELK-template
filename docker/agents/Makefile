.PHONY: *

include ${PWD}/docker/server/deploy/${CI_COMMIT_REF_SLUG}/.env
include ./${AGENT_NAME}/.env
include ./agents.env
COMPOSE_FILE=./${AGENT_NAME}/docker-compose.yml
export

build-agent-%:
	docker-compose build

push-agent-%:
	docker-compose push

pull-agent-%:
	docker-compose pull

deploy-agent-%:
	docker-compose up -d --no-build --force-recreate --remove-orphans
