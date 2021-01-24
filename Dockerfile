#FROM golang

#RUN go get github.com/aktau/github-release

#FROM centos:7

#COPY --from=0 /go/bin/github-release /usr/local/bin/

#ADD wandisco.repo /etc/yum.repos.d/

#RUN yum install -y yum-plugin-ovl subversion git gawk gettext time \
#		which ncurses-devel zlib-devel openssl-devel libxslt wget \
#		centos-release-scl && \
#	yum group install -y "Development Tools" && \
#	yum install -y rh-python38 && \
#	yum clean all
#
#WORKDIR /src

#ENV GIT_REPO=trinhpham/xiaomi-r3g-openwrt-builder

#ADD start.sh /src/

#CMD ["/src/start.sh"]

FROM openwrtorg/imagebuilder
RUN wget https://github.com/github-release/github-release/releases/latest/download/linux-amd64-github-release.bz2 
RUN bzip2 -d linux-amd64-github-release.bz2 
RUN	chmod +x ./linux-amd64-github-release 
RUN	sudo cp ./linux-amd64-github-release /usr/bin

WORKDIR /src
COPY . /src
RUN make /src
#CMD python /app/app.py