#!/bin/bash

service cron start

exec envoy -c /etc/envoy/envoy.yaml