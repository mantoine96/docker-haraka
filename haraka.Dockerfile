FROM gbleux/haraka:latest
#WIP
MAINTAINER Matthieu ANTOINE "matthieuinspain@gmail.com"

#Add plugins

#Install spamassassin and git
RUN apt-get update && install -y \ 
	spamassassin \
	git 
# Here we download the several files  we need in order to have the mailing list up and running
RUN wget -P /app/config/plugins https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins
RUN wget -P /app/plugins/rcpt_to.alias_forward.js https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins.d/rcpt_to.alias_forward.js
# Now we create the git repo where we're going to deploy
RUN mkdir /haraka-list
RUN git init /haraka-list --bare
# And add the hook that's gonna deploy the config
RUN wget -P /haraka-list/hooks/post-receive https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/post-receive