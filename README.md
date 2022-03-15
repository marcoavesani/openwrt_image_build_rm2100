[![Build Status](https://travis-ci.com/marcoavesani/openwrt_image_build_rm2100.svg?branch=master)](https://travis-ci.com/marcoavesani/openwrt_image_build_rm2100)

[Latest build](https://github.com/marcoavesani/openwrt_image_build_rm2100/releases/latest)

[Homepage](https://github.com/marcoavesani/openwrt_image_build_rm2100)

# Introduction
OpenWRT provides support for the Xiaomi Redmi AC2100 router in the snapshot branch with a minimal set of packages.
The purpose of this repository is to provide daily images, up-to-date with the snapshot, with additional packages customized for my needs.

The firmware is built using the : 
* [OpenWRT image builder](https://openwrt.org/docs/guide-user/additional-software/imagebuilder)
* [OpenWRT's docker image](https://hub.docker.com/r/openwrtorg/imagebuilder)
* [Custom Docker image ](https://hub.docker.com/r/marcoavesani/openwrt_image_build_rm2100)
* [Travis-CI](https://www.travis-ci.com/)

# Idea

The Dockerfile in this repo defines a container based on the [OpenWRT's docker image of the Image Builder](https://hub.docker.com/r/openwrtorg/imagebuilder).
When the the Docker is run it clones the build script and the modules defined in build_RM2100.sh.
Via GitHub actions, every commit triggers an automated Docker build, uploaded to [DockerHub](https://hub.docker.com/r/marcoavesani/openwrt_image_build_rm2100)
Then, [Travis-CI](https://travis-ci.com/github/marcoavesani/openwrt_image_build_rm2100) is triggered and the binaries are pushed in the [Latest build](https://github.com/marcoavesani/openwrt_image_build_rm2100/releases/latest) using [github-release](https://github.com/github-release/github-release)

# The Travis-CI build
You can view my automated build at [travis-ci.com](https://travis-ci.com/github/marcoavesani/openwrt_image_build_rm2100).
This build calls the build script `build_RM2100.sh` inside a Docker container of Docker image above.

# Acknowledgement
The code is based on [trinhpham/xiaomi-r3g-openwrt-builder](https://github.com/trinhpham/xiaomi-r3g-openwrt-builder)

