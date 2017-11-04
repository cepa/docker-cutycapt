FROM ubuntu:16.04
RUN apt-get update -y && apt-get install -y \
  build-essential \
  g++ \
  qt5-qmake \
  qt5-default \
  libqt5webkit5-dev \
  libqt5svg5-dev \
  libssl-dev \
  xvfb
RUN apt-get clean

WORKDIR /opt/cutycapt
COPY . .
RUN qmake
RUN make
RUN ln -s /opt/cutycapt/CutyCapt /usr/bin/cutycapt
