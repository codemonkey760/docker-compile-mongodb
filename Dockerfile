FROM ubuntu as mongodb-builder
ARG branch_name=master
RUN apt-get update && apt-get install -y build-essential git libcurl14-gnutls-dev liblzma-dev python3-pip
WORKDIR /usr/src
RUN git clone -b ${branch_name} https://github.com/mongodb/mongo.git
RUN python3 -m pip install -r etc/pip/compile-requirements.txt
RUN python3 buildscripts/scons.py install-mongod --disable-warnings-as-errors
