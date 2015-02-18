FROM gbleux/haraka:latest
#WIP
MAINTAINER Matthieu ANTOINE "matthieuinspain@gmail.com"

#Add plugins

#Install spamassassin and git
RUN apt-get update && apt-get install -y \ 
	spamassassin \
	git 
# Here we download the several files  we need in order to have the mailing list up and running
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins -O /app/config/plugins
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/plugins.d/rcpt_to.alias_forward.js -O /app/plugins/rcpt_to.alias_forward.js
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/rcpt_to.alias_forward -O /app/config/rcpt_to.alias_forward
# Now we create the git repo where we're going to deploy
RUN mkdir /haraka-list
RUN git init /haraka-list --bare
# And add the hook that's gonna deploy the config
RUN wget https://raw.githubusercontent.com/thehunt33r/docker-haraka/master/files/post-receive -O /haraka-list/hooks/post-receive
