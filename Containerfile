ARG ENVOY_VERSION=1.38

FROM envoyproxy/envoy:v${ENVOY_VERSION}-latest

RUN apt update && apt install -y logrotate tzdata && rm -rf /var/lib/apt/lists/*
COPY logrotate/logrotate.conf /etc/logrotate.d/envoy
RUN install -d -m 0755 -o envoy -g envoy /var/log/envoy

COPY logrotate/start.sh /start.sh
RUN chmod +x /start.sh && sed -i 's/required.*pam_loginuid.so/optional pam_loginuid.so/g' /etc/pam.d/cron 
CMD ["/start.sh"]
