#!/bin/bash

PROJECT_NAME=`whoami`-framework-project
SERVICE_ACCOUNT=`whoami`-serviceaccount

oc apply -R -f ./tasks/
oc apply -R -f ./resources/
oc apply -R -f ./pipelines/

tkn pipeline start framework-build-pipeline -r base-image=conda-dev-image --serviceaccount=$SERVICE_ACCOUNT
