FROM centos:7
LABEL maintainer "Chris Zervakis"

ENV container=docker

# Install Ansible via pip so we get the latest version.
ENV ansible_packages "ansible"

RUN yum -y update && yum clean all

RUN yum makecache fast \
    && yum -y install deltarpm epel-release initscripts \
    && yum -y update \
    && yum -y install \
        sudo \
        which \
        hostname \
        python3 \
        python3-pip \
    && yum clean all \
    && (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
        systemd-tmpfiles-setup.service ] || rm -f $i; done); \
        rm -f /lib/systemd/system/multi-user.target.wants/*;\
        rm -f /etc/systemd/system/*.wants/*;\
        rm -f /lib/systemd/system/local-fs.target.wants/*; \
        rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
        rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
        rm -f /lib/systemd/system/basic.target.wants/*;\
        rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN pip3 install -U pip
RUN pip3 install --no-cache $ansible_packages

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]
