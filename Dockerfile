FROM debian:stretch
MAINTAINER yovio@hotmail.com

ENV PYCHARM_HOME=/etc/pycharm
RUN apt-get update &&\
    apt-get install -y \
    wget \
    git \
    openjdk-8-jre \
    libxrender1 \
    libxtst6 \
    python3 \
	curl \
    --no-install-recommends
	
RUN wget https://download.jetbrains.com/python/pycharm-community-2017.3.3.tar.gz -O /tmp/pycharm.tar.gz && \
	mkdir ${PYCHARM_HOME} && tar -xzvf /tmp/pycharm.tar.gz -C ${PYCHARM_HOME} --strip=1 && \
	curl https://bootstrap.pypa.io/get-pip.py | python3 && \
	rm -rf /var/lib/apt-lists && rm -rf /tmp/* && apt-get autoremove -y
	

ENTRYPOINT ["/etc/pycharm/bin/pycharm.sh"]