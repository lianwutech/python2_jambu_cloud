FROM linkworld/python2_pyv8:v1

MAINTAINER linkworld/python2_jambu_cloud

RUN apt-get update

RUN apt-get install -y git 
RUN apt-get install -y unzip

RUN mkdir -p /usr/src/sdk
WORKDIR /usr/src/sdk
COPY . /usr/src/sdk

# install mns
RUN unzip -o /usr/src/sdk/mns_python_sdk*.zip -d /usr/src/sdk
RUN rm /usr/src/sdk/mns_python_sdk*.zip
RUN cd /usr/src/sdk/mns_python_sdk* && python setup.py install

# install ots
RUN unzip -o /usr/src/sdk/ots_python_sdk*.zip -d /usr/src/sdk
RUN rm /usr/src/sdk/ots_python_sdk*.zip
RUN cd /usr/src/sdk/ots_python_sdk*/pymodules && ./install_modules_for_ots_python_sdk.sh
RUN cd /usr/src/sdk/ots_python_sdk* && python setup.py install

RUN rm -rf /usr/src/sdk




