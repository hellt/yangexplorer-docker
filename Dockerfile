FROM ubuntu:14.04
MAINTAINER Roman Dodin <dodin.roman@gmail.com>
RUN DEBIAN_FRONTEND=noninteractive apt-get update; apt-get install -y python2.7 python-pip python-virtualenv git graphviz libxml2-dev libxslt1-dev python-dev zlib1g-dev
RUN DEBIAN_FRONTEND=noninteractive git clone https://github.com/CiscoDevNet/yang-explorer.git
WORKDIR /yang-explorer
RUN bash setup.sh -y
RUN sed -i -e 's/HOST=\x27localhost\x27/HOST=$HOSTNAME/g' start.sh
CMD ["bash", "start.sh"]
