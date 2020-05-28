.PHONY: *

include ./${CI_COMMIT_REF_SLUG}/.env
COMPOSE_FILE=./docker-compose.yml:./${CI_COMMIT_REF_SLUG}/docker-compose.yml
export

deploy-server:
	docker-compose up -d --no-build --force-recreate --remove-orphans
