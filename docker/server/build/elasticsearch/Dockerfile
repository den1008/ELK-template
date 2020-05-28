FROM docker.elastic.co/elasticsearch/elasticsearch:7.7.0

COPY config/elasticsearch.yml /usr/share/elasticsearch/config/

COPY bin/entrypoint.sh /entrypoint.sh

RUN chmod 660 /usr/share/elasticsearch/config/elasticsearch.yml && \
    chmod +x /entrypoint.sh