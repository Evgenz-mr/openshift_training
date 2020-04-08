#!/bin/bash
if [ ! -d /tmp/docker/work ]; then
  mkdir -p /tmp/docker/work
  chcon -Rt svirt_sandbox_file_t /tmp/docker/work
  sudo chown 1001:1001 /tmp/docker/work
fi

docker run -d -v /tmp/docker/work:/opt/nexus/sonatype-work nexus
