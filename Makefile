.PHONY: *

include ./docker/docker.env
export

##
# Сборка и деплой агентов, загрузка/получение образов в/из CI Registry.
# Запуск команд производится по имени папки в директории docker/agents, например, build-agent-local произведет сборку
# агентов из директории docker/agents/local/docker-compose.yml.
##
build-agent-% push-agent-% pull-agent-% deploy-agent-%:
	export AGENT_NAME=$* && make -C ./docker/agents $@

##
# Сборка сервера ELK, загрузка/получение образов в/из CI Registry.
##
build-server push-server pull-server:
	make -C ./docker/server/build $@
##
# Деплой сервера ELK
##
deploy-server:
	make -C ./docker/server/deploy $@

##
# Локальный запуск приложения мониторинга (локальная разработка)
##
install:
	make build-server
	make build-agent-local
	make deploy-server
	make deploy-agent-local

##
# Установка прав на тома докера ElasticSearch (костыль, другого решения пока нет)
# Необходим запуск от рута
##
permission:
	mkdir -p ${ELASTIC_VOLUMES_DIR}
	chown 1000:1000 -R ${ELASTIC_VOLUMES_DIR}

##
# Добавить записи в hosts
# Необходимо запускать от рута, т.к. необходимо произвести изменения в файле /etc/hosts
##
hosts:
	sed -zi 's/#backend monitoring domains start.*#backend monitoring domains end\n//' /etc/hosts
	sed -i "2i#backend monitoring domains start\n\
	    127.0.0.100	monitoring.elasticsearch \n \
	    127.0.0.101	monitoring.logstash \n \
		127.0.0.102	monitoring.kibana \n \
		\r#backend monitoring domains end" /etc/hosts
