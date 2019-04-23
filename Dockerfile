FROM selenium/standalone-chrome

USER root
RUN apt-get update

RUN apt-get install -y build-essential

# Install Git
RUN apt-get install -y git

# Install ssh-agent
RUN apt-get install -y openssh-client

# Install Firefox
RUN apt-get install -y firefox

# Install xvfb
RUN apt-get install -y xvfb

# Install Node
RUN apt-get install -y curl 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm

RUN echo "unsafe-perm=true" > ~/.npmrc

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

# Add json - merges json files
RUN npm i -g json-merge-patch-cli

# Install bower
RUN npm i -g bower

# Install Polymer CLI
RUN npm i -g polymer-cli

# Install firebase CLI
RUN npm i -g firebase-tools

RUN npm i -g webdriverio \
    wdio-mocha-framework \
    wdio-selenium-standalone-service \
    wdio-spec-reporter \
    wdio-webcomponents

# RUN firefox -v

RUN google-chrome --version

RUN polymer --version

RUN yarn --version

RUN node --version

RUN npm --version

RUN bower --version

ADD startup.sh /

RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]

