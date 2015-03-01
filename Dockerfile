FROM centos:7
MAINTAINER Matthieu ANTOINE "matthieuinspain+dockerhub@gmail.com"
RUN yum -y update && yum -y upgrade && \
yum -y install spamassassin git curl wget
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs gcc-c++ make
RUN npm install -g Haraka
RUN mkdir -p /app /haraka-list
RUN haraka -i /app
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins -O /app/config/plugins
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins.d/rcpt_to.alias_forward.js -O /app/plugins/rcpt_to.alias_forward.js
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/rcpt_to.alias_forward -O /app/config/rcpt_to.alias_forward
RUN git init /haraka-list --bare
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/post-receive -O /haraka-list/hooks/post-receive
RUN haraka -c /app
EXPOSE 25
