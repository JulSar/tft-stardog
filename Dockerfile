FROM centos:centos7

MAINTAINER baptiste <baptistezegre@gmail.com>

RUN yum -y update && yum clean all

RUN yum -y install java && yum clean all

RUN curl http://packages.stardog.com/rpms/stardog.repo > /etc/yum.repos.d/stardog.repo

RUN yum install -y stardog && yum clean all

WORKDIR /

RUN mkdir /data/

RUN mkdir /data/stardog

ENV STARDOG_HOME=/data/stardog

COPY stardog-license-key.bin /$STARDOG_HOME

EXPOSE 5820

RUN ./opt/stardog/bin/stardog-admin server start
RUN ./opt/stardog/bin/stardog-admin db create -n test data.ttl


