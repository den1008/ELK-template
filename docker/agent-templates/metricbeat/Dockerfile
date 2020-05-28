FROM docker.elastic.co/beats/metricbeat:7.7.0

USER root

COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml

RUN chmod go-w /usr/share/metricbeat/metricbeat.yml