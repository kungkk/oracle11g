FROM    centos:7
MAINTAINER "kkk" <kkk@jccsoftware.com>
RUN	mkdir -p /run/lock/subsys; \
	yum install -y libaio bc flex net-tools; \
	yum clean all

# Create group named "dba"
RUN groupadd dba

# Create user named "oracle" and joined into "dba" group
RUN useradd -G dba oracle


#passwd oracle

# Create oracle directory
RUN mkdir -p /usr/src/oracle
WORKDIR /usr/src/oracle

# Bundle unzipped oracle installer
COPY . /usr/src/oracle

#RUN yum localinstall -y /usr/src/oracle/Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm
#RUN cd /usr/src/oracle/Disk1
#RUN rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm
