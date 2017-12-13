FROM centos:centos7

MAINTAINER baptiste <baptistezegre@gmail.com>

RUN yum -y update && yum clean all

RUN yum -y install java && yum clean all

RUN curl http://packages.stardog.com/rpms/stardog.repo > /etc/yum.repos.d/stardog.repo

RUN yum install -y stardog && yum clean all

ENV STARDOG_HOME=/data/stardog


EXPOSE 5820