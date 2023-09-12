#! /bin/bash

mkdir -p /usr/local/share/ca-certificates
mv /tmp/assets/local.crt /usr/local/share/ca-certificates/local.crt
chmod 733 /usr/local/share/ca-certificates/local.crt

update-ca-certificates
