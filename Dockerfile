FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ARG DEPS="\
    git\
    libmysqlclient-dev\
    libssl-dev\
    libluajit-5.1-dev\
    libzmq3-dev\
    pkg-config\
    build-essential\
    cmake"

RUN apt-get update &&\
   apt-get install -y $DEPS &&\
   rm -rf /var/lib/apt/lists/*
