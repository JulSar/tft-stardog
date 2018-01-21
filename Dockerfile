FROM centos:centos7

ENV STARDOG_HOME=/data/stardog
ENV STARDOG_INSTALL_DIR = /opt/stardog

RUN mkdir -p /data/stardog
RUN mkdir -p /opt/stardog

RUN yum -y update && yum clean all
RUN yum -y install java && yum clean all

RUN curl http://packages.stardog.com/rpms/stardog.repo > /etc/yum.repos.d/stardog.repo
RUN yum install -y stardog && yum clean all

COPY stardog-license-key.bin /opt/stardog
COPY init_stardog.sh /data/stardog

WORKDIR /data/stardog
CMD ["/usr/sbin/init"]
EXPOSE 5820
