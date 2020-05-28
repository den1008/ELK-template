#!/bin/sh

bin/elasticsearch-keystore create && \
printf "$ELASTIC_ROOT_PASSWORD" | bin/elasticsearch-keystore add "bootstrap.password"

exec "$@"
