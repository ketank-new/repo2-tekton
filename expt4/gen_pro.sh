#!/bin/bash

PROJECT_NAME=`whoami`-framework-project
ARTIFACT_NAME=artifact-secret
SERVICE_ACCOUNT=`whoami`-serviceaccount

oc new-project $PROJECT_NAME
echo "------------------------------------------------------------------------------"
echo "WARNING:  You must have already authenticated with artifactory on this machine"
echo "------------------------------------------------------------------------------"

#Create secret based on your config.json
oc create secret generic $ARTIFACT_NAME \
    --from-file=.dockerconfigjson=$HOME/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson

#Add necessary tekton annotations
oc annotate secret/$ARTIFACT_NAME tekton.dev/docker-0='http://sys-powerai-condaimages-docker-local.artifactory.swg-devops.com/'

oc create sa $SERVICE_ACCOUNT
oc secrets link $SERVICE_ACCOUNT  $ARTIFACT_NAME


#We need to clone repos within the container.  Need to have an internal ssh key setup
oc create secret generic git-access \
    --from-file=ssh-privatekey=$HOME/.ssh/id_rsa \
    --type=kubernetes.io/ssh-auth
