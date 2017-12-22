FROM centos:centos7

ENV STARDOG_HOME=/data/stardog
ENV STARDOG_INSTALL_DIR = /opt/stardog

RUN mkdir -p ${STARDOG_HOME}
RUN mkdir -p ${STARDOG_INSTALL_DIR}

RUN yum -y update && yum clean all
RUN yum -y install java && yum clean all

RUN curl http://packages.stardog.com/rpms/stardog.repo > /etc/yum.repos.d/stardog.repo
RUN yum install -y stardog && yum clean all

ADD stardog-license-key.bin ${STARDOG_INSTALL_DIR}
ADD init_stardod.sh ${STARDOG_INSTALL_DIR}

WORKDIR ${STARDOG_HOME}

CMD ${STARDOG_INSTALL_DIR}/init_stardog.sh

EXPOSE 5820
