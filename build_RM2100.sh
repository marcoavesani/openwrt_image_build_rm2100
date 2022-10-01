#!/bin/bash

set -xe

RELEASE_NAME=$(date +%Y%m%d_%H%M%S)
RELEASE_MODULES=`cat modules.txt`
#GIT_USER=${GIT_REPO%%/*}
#GIT_REPO_NAME=${GIT_REPO##*/}

GIT_USER=marcoavesani
GIT_REPO_NAME=openwrt_image_build_rm2100

echo "Begin build ${RELEASE_NAME} with modules ${RELEASE_MODULES}"
echo "Using git user ${GIT_USER} with git repo name ${GIT_REPO_NAME}"

# scl enable rh-python38 bash
#source /opt/rh/rh-python38/enable

echo "Current directory"
pwd

wget https://downloads.openwrt.org/snapshots/targets/ramips/mt7621/openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
tar -xvf openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz >/dev/null
rm -f openwrt-imagebuilder-ramips-mt7621.Linux-x86_64.tar.xz
cd openwrt-imagebuilder-ramips-mt7621.Linux-x86_64
make image PROFILE=xiaomi_redmi-router-ac2100 "PACKAGES=${RELEASE_MODULES}"

echo "Running dir"
pwd
echo "Current ouput dir"
ls -laR bin/targets/ramips/mt7621/

# if [ $? -eq 0 ] ; then
# 	if [[ ! -z "$GITHUB_TOKEN" ]] ; then
# 		echo "Begin upload the release: $RELEASE_NAME"

# 		github-release release \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name $RELEASE_NAME \
# 			--description "CI build includes: ${RELEASE_MODULES}"
			
# 		sleep 10
			
# 		github-release upload \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100.manifest \
# 			--file bin/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100.manifest
			
# 		sleep 10
		
# 		github-release upload \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-rootfs0.bin \
# 			--file bin/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-rootfs0.bin
			
# 		sleep 10
		
# 		github-release upload \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name sha256sums \
# 			--file bin/targets/ramips/mt7621/sha256sums
			
# 		sleep 10

# 		github-release upload \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-kernel1.bin \
# 			--file bin/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-kernel1.bin
		
# 		sleep 10	
		
# 		github-release upload \
# 			--user $GIT_USER \
# 			--repo $GIT_REPO_NAME \
# 			--tag $RELEASE_NAME \
# 			--name openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-sysupgrade.bin \
# 			--file bin/targets/ramips/mt7621/openwrt-ramips-mt7621-xiaomi_redmi-router-ac2100-squashfs-sysupgrade.bin
# 	else
# 		echo "Skip github release uploading"
# 	fi
# else
# 	echo "Build has been failed or Github token not found!"
# 	exit 2
# fi
