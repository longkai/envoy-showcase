ARG ENVOY_VERSION=1.34

FROM envoyproxy/envoy:v${ENVOY_VERSION}-latest
RUN apt-get update; \
    apt-get install --no-install-recommends -y logrotate tzdata; \
    rm -rf /var/lib/apt/lists/*
RUN install -d -m 0755 -o envoy -g envoy /var/log/envoy
