FROM centos:7
MAINTAINER Matthieu ANTOINE "matthieuinspain+dockerhub@gmail.com"
RUN yum -y update && yum -y upgrade && \
yum -y install spamassassin git curl
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs gcc-c++ make
RUN npm install -g Haraka
RUN haraka -i /app
RUN wget https://github.com/thehunt33r/docker-haraka/blob/master/files/plugins -O  /app/config/plugins
RUN wget https://github.com/thehunt33r/docker-haraka/blob/master/files/rcpt_to.alias_forward.js -O /app/plugins/rcpt_to.alias_forward.js
COPY wget -O https://github.com/thehunt33r/docker-haraka/blob/master/files/rcpt_to.alias_forward -O /app/config/rcpt_to.alias_forward
RUN haraka -c /app/
EXPOSE 25
