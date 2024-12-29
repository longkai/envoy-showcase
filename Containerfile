ARG ENVOY_VERSION=1.31

FROM envoyproxy/envoy:v${ENVOY_VERSION}-latest
RUN apt update && apt install -y logrotate tzdata
RUN install -d -m 0755 -o envoy -g envoy /var/log/envoy