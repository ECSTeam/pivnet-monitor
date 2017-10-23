#!/bin/bash

set -eu

curl -k "$CONCOURSE_URL/api/v1/cli?arch=amd64&platform=linux" >> fly
chmod +x fly

fly -t concourse login -c $CONCOURSE_URL -k -u $CONCOURSE_USER -p $CONCOURSE_PWD
fly -t concourse trigger-job -j $PIPELINE_NAME/$JOB_NAME
