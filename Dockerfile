FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

# For the convenience for users in China mainland
COPY apt-sources.list /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y

RUN mkdir /mvpose
WORKDIR /mvpose

RUN apt-get install -y zlib1g zlib1g-dev
