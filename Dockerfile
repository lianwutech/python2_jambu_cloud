FROM linkworld/python2_pyv8:v1

MAINTAINER linkworld/python2_jambu_cloud

RUN apt-get update

RUN apt-get install -y git 
RUN apt-get install -y unzip

RUN mkdir -p /usr/src/sdk
WORKDIR /usr/src/sdk
COPY . /usr/src/sdk

# install mns
RUN unzip -o /usr/src/sdk/aliyun-mns-python-sdk*.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/aliyun-mns-python-sdk*
RUN python setup.sh install

# install ots
RUN unzip -o /usr/src/sdk/ots_python_sdk*.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/ots_python_sdk*
RUN cd pymodules*
RUN ./install_modules_for_ots_python_sdk.sh
RUN cd ..
RUN python setup.sh install

RUN rm -rf /usr/src/sdk




