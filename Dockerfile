FROM quay.io/pires/docker-elasticsearch:2.4.1

MAINTAINER alex@ninneman.org

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin install io.fabric8/elasticsearch-cloud-kubernetes/2.4.1 --verbose

# Install Elasticsearch Shield plug-in
RUN /elasticsearch/bin/plugin install license
RUN /elasticsearch/bin/plugin install shield

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery
