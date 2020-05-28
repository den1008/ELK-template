FROM docker.elastic.co/beats/filebeat:7.7.0

USER root

COPY filebeat.yml.example /usr/share/filebeat/filebeat.yml

RUN chmod go-w /usr/share/filebeat/filebeat.yml