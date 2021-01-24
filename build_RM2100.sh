#!/bin/bash

set -xe

RELEASE_NAME=v0.2-$(date +%Y%m%d_%H%M%S)
RELEASE_MODULES=`cat modules.txt`
GIT_USER=${GIT_REPO%%/*}
GIT_REPO_NAME=${GIT_REPO##*/}

echo "Begin build ${RELEASE_NAME} with modules ${RELEASE_MODULES}"

# scl enable rh-python38 bash
#source /opt/rh/rh-python38/enable

wget https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
tar -xvf openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz >/dev/null
rm -f openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
cd openwrt-imagebuilder-ramips-mt7621.Linux-x86_64
make image PROFILE=xiaomi_redmi-router-ac2100 "PACKAGES=${RELEASE_MODULES}"

echo "Current ouput dir"
ls -laR bin/targets/ramips/mt7621/

fi
