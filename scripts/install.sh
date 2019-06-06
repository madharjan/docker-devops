#!/bin/bash
set -e
export LC_ALL=C
export DEBIAN_FRONTEND=noninteractive

if [ "${DEBUG}" = true ]; then
  set -x
fi

## Install
apt-get update && apt-get upgrade -y

apt-get install -y git-core default-jdk wget curl dos2unix build-essential jq locales
apt-get install -y unzip xvfb libxi6 libgconf-2-4 chromium-browser chromium-chromedriver

apt-get install -y docker.io
curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

apt-get install -y python

wget -nv https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh
mkdir -p ${HOME}/bin/
mv install.sh ${HOME}/bin/nvm_install.sh
chmod +x ${HOME}/bin/nvm_install.sh
chown ${USER}:${USER} ${HOME}/bin/nvm_install.sh

## Configure
locale-gen en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"' | tee -a /etc/environment

echo 'LANGUAGE="en_US.UTF-8"' | tee -a /etc/environment
echo 'LANG="en_US.UTF-8"' | tee -a /etc/environment
echo 'LC_ALL="en_US.UTF-8"' | tee -a /etc/environment

${HOME}/bin/nvm_install.sh