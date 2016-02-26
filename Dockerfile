FROM ubuntu:latest
MAINTAINER xchen@jxmobi.com

RUN apt-get update && \
	apt-get install -y curl && \
	apt-get install -y git && \
	curl -sL https://deb.nodesource.com/setup_0.12 | sudo -E bash - && \
	apt-get install -y nodejs && \
	npm install -g bower && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir src/
WORKDIR src/

CMD ["npm", "start"]

ONBUILD COPY ./package.json ./
ONBUILD RUN npm install
ONBUILD COPY ./.bowerrc ./
ONBUILD COPY ./bower.json ./
ONBUILD RUN bower install --allow-root
ONBUILD COPY . .
