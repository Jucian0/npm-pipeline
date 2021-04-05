FROM centos:7
MAINTAINER "Shane Fast" <shane@get-paper.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
   systemd-tmpfiles-setup.service ] || rm -f $i; done); \
   rm -f /lib/systemd/system/multi-user.target.wants/*;\
   rm -f /etc/systemd/system/*.wants/*;\
   rm -f /lib/systemd/system/local-fs.target.wants/*; \
   rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
   rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
   rm -f /lib/systemd/system/basic.target.wants/*;\
   rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

FROM node:15.12.0
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 \
   && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list \
   && apt-get update \
   && apt-get install -y -qq curl \
   && apt-get clean

# Install jq (for parsing json with bash)
RUN curl -o /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq \
   && chmod +x /usr/local/bin/jq
# Define working directory.
WORKDIR /data
CMD ["-"]
ENTRYPOINT ["jq"]
