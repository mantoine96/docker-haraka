FROM gbleux/haraka:latest
#WIP
MAINTAINER Matthieu ANTOINE "matthieuinspain@gmail.com"

#Add plugins

#Install spamassassin
RUN apt-get update && install -y \
	spamassassin \
	git 
ADD 