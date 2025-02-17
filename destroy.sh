#!/usr/bin/env bash

podman pod rm -f netbox

podman secret rm netbox-secret-key
podman secret rm redis-pw
podman secret rm postgres-pw
