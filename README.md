[![Build Status](https://travis-ci.org/marcoavesani/openwrt_image_build_rm2100.svg?branch=master)](https://travis-ci.org/marcoavesani/openwrt_image_build_rm2100])

[Latest build](https://github.com/[actual_link]/releases/latest)

[Homepage](https://github.com/[actual_link])

# Introduction
OpenWRT provides support for the Xiaomi Redmi AC2100 router in the snapshot branch with a minimal set of packages.
The purpose of this repository is to provide daily images, up-to-date with the snapshot, with additional packages customized for my needs.

The firmware is built using the : 
* [OpenWRT image builder](https://openwrt.org/docs/guide-user/additional-software/imagebuilder)
* [OpenWRT's docker image](https://hub.docker.com/r/openwrtorg/imagebuilder)
* [Travis-CI](https://www.travis-ci.com/)

# The Travis-CI build
You can view my automated build at [travis-ci.org](https://travis-ci.org/trinhpham/xiaomi-r3g-openwrt-builder).
This build calls the build script `build_mir3g.sh` inside a Docker container of Docker image above.



# Debug
- Build the docker image by command `docker build -t testbuild:latest docker/`
- Run the build image with command `docker run -it --rm -e GIT_REPO=trinh/test -v $(pwd):/src/test testbuild:latest`

# Acknowledgement
The code is based on [trinhpham/xiaomi-r3g-openwrt-builder](https://github.com/trinhpham/xiaomi-r3g-openwrt-builder)