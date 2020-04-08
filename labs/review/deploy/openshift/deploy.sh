#!/bin/bash
oc login -u developer
oc new-project review
sh setpolicy.sh
sh create-pv.sh
oc process -f resources/nexus-template.json | oc create -f -
oc get pods -w
