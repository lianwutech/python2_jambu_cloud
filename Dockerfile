FROM FROM merlinran/python2.7-pyv8-1.0-dev

MAINTAINER daviddeng/python_jambu_cloud

RUN apt-get update

RUN apt-get install -y git 
RUN apt-get install -y unzip

RUN mkdir -p /usr/src/sdk

# install mns
RUN curl -SL "https://docs-aliyun.cn-hangzhou.oss.aliyun-inc.com/cn/mns/0.0.2/assets/sdks/aliyun-mns-python-sdk-1.0.2.zip" -o aliyun-mns-python-sdk.zip
RUN unzip -o aliyun-mns-python-sdk.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/aliyun-mns-python-sdk*
RUN python setup.sh install

# install ots
RUN curl -SL "http://oss.aliyuncs.com/aliyun_portal_storage/help/ots/ots_python_sdk_2.0.4.zip?spm=5176.383723.9.7.ab3saS&file=ots_python_sdk_2.0.4.zip" -o ots_python_sdk.zip
RUN unzip -o ots_python_sdk.zip -d /usr/src/sdk
RUN cd /usr/src/sdk/aliyun-mns-python-sdk*
RUN cd pymodules*
RUN ./install_modules_for_ots_python_sdk.sh
RUN cd ..
RUN python setup.sh install

RUN rm -rf /usr/src/sdk




