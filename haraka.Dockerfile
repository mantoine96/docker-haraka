FROM gbleux/haraka:latest
#WIP
MAINTAINER Matthieu ANTOINE "matthieuinspain@gmail.com"

#Add plugins

#Install spamassassin
RUN apt-get update && install -y \
	spamassassin \
	git 
RUN wget -P /app/config/plugins https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins
RUN wget -P /app/plugins/rcpt_to.alias_forward.js https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins.d/rcpt_to.alias_forward.js
RUN mkdir /haraka-list
RUN git init /haraka-list --bare
RUN wget -P /haraka-list/hooks/post-receive https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/post-receive

