FROM selenium/standalone-chrome
MAINTAINER Daniel Turner <001.daniel.turner@gmail.com>

USER root
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN apt-get install -y openssh-client
RUN apt-get install -y git
RUN apt-get install -y xvfb
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn
RUN npm i -g bower
RUN npm i -g polymer-cli
RUN npm i -g firebase-tools
RUN npm i -g webdriverio \
    wdio-mocha-framework \
    wdio-selenium-standalone-service \
    wdio-spec-reporter \
    wdio-webcomponents

ADD startup.sh /

RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]

