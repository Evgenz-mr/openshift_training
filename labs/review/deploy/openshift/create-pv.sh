#!/bin/bash
pv=nexus
oc login -u admin -p redhat https://master.lab.example.com &>/dev/null
if oc get pv  | grep -q ${pv}; then
  oc delete pv pv-nexus
fi

declare -a nodes=( node1 node2 )
for node in ${nodes[@]}; do
  ssh student@${node} \
    "sudo rm -fr /tmp/openshift && \
    sudo mkdir -p /tmp/openshift/work && \
    sudo chcon -Rt svirt_sandbox_file_t /tmp/openshift/work && \
    sudo chown 1001:1001 /tmp/openshift/work"
done
oc create -f resources/pv.yaml
oc login -u developer -p redhat https://master.lab.example.com &>/dev/null

