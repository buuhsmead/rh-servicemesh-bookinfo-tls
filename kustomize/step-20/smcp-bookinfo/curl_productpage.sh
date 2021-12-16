#!/usr/bin/env bash

set -x


PRODUCTPAGE_URL=$(oc get route -l maistra.io/gateway-name=bookinfo-gateway -n smcp-bookinfo -o jsonpath='{.items[0].spec.host}')


while true
do
  curl -v "https://${PRODUCTPAGE_URL}/productpage?u=normal" --cacert productpage-tls.crt
  sleep 1
done

