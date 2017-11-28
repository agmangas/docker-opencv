FROM ubuntu:16.04

RUN mkdir -p /opencv
WORKDIR /opencv

COPY install-deps.sh .
RUN bash install-deps.sh

COPY install-opencv.sh .
RUN bash install-opencv.sh
