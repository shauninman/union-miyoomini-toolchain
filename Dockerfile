FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg --add-architecture armhf && \
  apt-get -y update  \
  && apt-get -y install \
    build-essential \
	scons \
	crossbuild-essential-armhf \
	libsdl1.2-dev:armhf \
	libsdl-image1.2-dev:armhf \
	libsdl-mixer1.2-dev:armhf \
	libsdl-ttf2.0-dev:armhf \
	libpng-dev:armhf \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/workspace
WORKDIR /root

COPY my283/include /usr/include/
COPY my283/lib /usr/lib/

COPY setup-env.sh .
RUN cat setup-env.sh >> .bashrc

VOLUME /root/workspace
WORKDIR /root/workspace

CMD ["/bin/bash"]