#!/bin/bash
set -ex
export DEBIAN_FRONTEND=noninteractive
apt-get update -yq
apt-get upgrade -yq
apt-get install -yq $(cat /tmp/req-apt.txt | tr '\n' ' ')