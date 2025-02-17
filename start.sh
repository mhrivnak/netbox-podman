#!/usr/bin/env bash

echo "
apiVersion: v1
kind: Secret
metadata:
  name: netbox-secret-key
stringData:
  SECRET_KEY: $(podman run --rm -it docker.io/netboxcommunity/netbox:latest /opt/netbox/netbox/generate_secret_key.py)" | podman secret create netbox-secret-key -

echo "
apiVersion: v1
kind: Secret
metadata:
  name: redis-pw
stringData:
  REDIS_PASSWORD: $(tr -dc A-Za-z0-9 </dev/urandom | head -c 32; echo)" | podman secret create redis-pw -

echo "
apiVersion: v1
kind: Secret
metadata:
  name: postgres-pw
stringData:
  POSTGRES_PASSWORD: $(tr -dc A-Za-z0-9 </dev/urandom | head -c 32; echo)" | podman secret create postgres-pw -

podman play kube pod.yml

echo -n "⏳ Waiting for Netbox to start."
sleep 1
until curl -s -I http://localhost:8080/login/ > /dev/null; do echo -n "."; sleep 1; done

echo ""
echo ""
echo "🦸 Creating Superuser... answer the questions..."
echo ""

podman exec -it netbox-netbox /opt/netbox/netbox/manage.py createsuperuser

echo ""
echo "✅ Netbox is ready at http://localhost:8080"