FROM envoyproxy/envoy:v1.31-latest
RUN apt update && apt install -y logrotate
RUN install -d -m 0755 -o envoy -g envoy /var/log/envoy