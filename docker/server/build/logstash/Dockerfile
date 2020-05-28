FROM docker.elastic.co/logstash/logstash:7.7.0

USER root

RUN mkdir /usr/share/logstash/config/patterns

COPY config/logstash.yml /usr/share/logstash/config/

COPY config/logstash.conf /usr/share/logstash/pipeline/

COPY config/patterns/* /usr/share/logstash/config/patterns/

RUN chmod 660 /usr/share/logstash/config/logstash.yml /usr/share/logstash/pipeline/logstash.conf /usr/share/logstash/config/patterns/*