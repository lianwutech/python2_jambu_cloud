FROM merlinran/python2.7-pyv8-1.0-dev

MAINTAINER daviddeng/python_jambu_cloud

RUN apt-get update

RUN apt-get install -y git 
RUN apt-get install -y unzip

RUN mkdir -p /usr/src/sdk

# install mns
RUN curl -SL "https://github.com/lianwutech/python_jambu_cloud/blob/master/aliyun-mns-python-sdk-1.0.2.zip" -o aliyun-mns-python-sdk.zip
RUN unzip -o aliyun-mns-python-sdk.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/aliyun-mns-python-sdk*
RUN python setup.sh install

# install ots
RUN curl -SL "https://github.com/lianwutech/python_jambu_cloud/blob/master/ots_python_sdk_2.0.4_1.zip" -o ots_python_sdk.zip
RUN unzip -o ots_python_sdk.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/aliyun-mns-python-sdk*
RUN cd pymodules*
RUN ./install_modules_for_ots_python_sdk.sh
RUN cd ..
RUN python setup.sh install

RUN rm -rf /usr/src/sdk




