#!/bin/bash
pv=nexus
oc login -u admin -p redhat https://master.lab.example.com &>/dev/null
if oc get pv  | grep -q ${pv}; then
  oc delete pv pv-nexus
fi
oc login -u developer -p redhat https://master.lab.example.com &>/dev/null

declare -a nodes=( node1 node2 )
for node in ${nodes[@]}; do
  ssh student@${node} sudo rm -fr /tmp/openshift
done
