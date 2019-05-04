#!/usr/bin/env bash

echo -n " Enter Google Pagespeed Insights Key: "; read PIK;
echo -n " Enter Grafana Admin Password: "; stty -echo; read PASSWORD; stty echo; echo

# Required for garie-browsertime (needs to know where to map reports back too as its docker in docker...)
REPORT_DIR=$(pwd)/plugins/garie-browsertime \
DOCKER_PATH=$(which docker) \
CURRENT_UID=$(id -u):$(id -g) \
PAGESPEED_INSIGHTS_KEY=$PIK \
GF_SECURITY_ADMIN_PASSWORD=$PASSWORD \
docker-compose up \

# Clear variables
PIK=
PASSWORD=
