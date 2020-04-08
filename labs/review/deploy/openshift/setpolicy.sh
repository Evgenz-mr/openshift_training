#!/bin/bash
oc_edp=master.lab.example.com
oc_p=redhat

oc login -u admin -p ${oc_p} https://${oc_edp} &>/dev/null
oc adm policy add-scc-to-user anyuid -z default
oc login -u developer -p ${oc_p} https://${oc_edp} &>/dev/null