#!/bin/bash

echo "Welcome to Wordpress Wizard on OKD "
echo "Before you start make sure that you can login to your cluster "
echo "using 'oc login' " 
echo "And verify no project with name 'wordpress' "
oc new-project wordpress

oc create -f templates/build-config.yml 

oc start-build docker-build
echo " Building docker image "
sleep 3m
oc create -f templates/secrets.yml 
oc create -f templates/Volume.yml 
oc create -f templates/Deployment-config-db.yml 
oc create -f templates/Service-db.yml 
oc create -f templates/Deployment-config-Wp.yml 
oc create -f templates/Service-wp.yml 
oc create -f templates/route.yml


echo "Congratulation ! your Wordpress is ready and you can acess via: "
echo "$(oc get route -o yaml | grep "host:" | tail -n1 | cut -c 13-)"

