#!/bin/bash

set -xe

openssl genrsa -des3 -out jenkins-ci.key 2048
openssl req -new -key jenkins-ci.key -out jenkins-ci.csr
cp jenkins-ci.key jenkins-ci.key.orig
openssl rsa -in jenkins-ci.key.orig -out jenkins-ci.key
rm jenkins-ci.key.orig
openssl x509 -req -days 365 -in jenkins-ci.csr -signkey jenkins-ci.key -out jenkins-ci.crt
rm jenkins-ci.csr

sudo cp jenkins-ci.crt /etc/ssl/certs/jenkins-ci.crt
sudo cp jenkins-ci.crt /etc/ssl/certs/jenkins-ci.crt

