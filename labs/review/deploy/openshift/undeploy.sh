#!/bin/bash
oc login -u developer
oc project review
oc delete all -l app=nexus
oc delete pvc nexus
sh delete-pv.sh
oc delete project review
