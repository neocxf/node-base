FROM ubuntu:latest
MAINTAINER xchen@jxmobi.com

RUN apt-get update && \
	apt-get install -y curl && \
	curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash - && \
	apt-get install -y nodejs && \
	npm install -g bower && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir src/
WORKDIR src/

CMD ["npm", "start"]

ONBUILD COPY ./package.json ./
ONBUILD RUN npm install && bower install
ONBUILD COPY . .
ONBUILD RUN bower install
