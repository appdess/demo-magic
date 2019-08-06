#!/usr/bin/env bash

########################
# include the magic
########################
. ../demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear


# Logon to the K8s master node
p "ssh ubuntu@172.30.117.22"

# check if the cluster is healthy (Showing a "Ready" status)
pe "kubectl get nodes"
pe "cd demo/"
pe "ls"
p "cat vmc-nginx.yaml"
p "kubectl apply -f vmc-nginx.yaml"
# check the state of the deployment:
p "kubectl get deploy"
# show the pods which have been created by our deployment - we filter them by their label "vmc-nginx". You will notice that each pod got it´s own IP by our overlay-network (Calico). This is K8s internal networking and not accessible from the outside.
pe kubectl get pods -l run=vmc-nginx -o wide

# show the service-definition
p "cat service.yaml"
p "kubectl apply -f service.yaml"
p "kubectl get svc"
p "cat \"something you dont want to really run\""
# show the Kubernetes Worker Node-IPs:
p "kubectl get nodes -o wide"
#show that it works:
p "curl http://172.30.117.23:30102"
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
