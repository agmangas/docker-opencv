#!/bin/bash

# install dependencies

apt-get update
apt-get install -y build-essential cmake unzip wget
apt-get install -y libgtk2.0-dev
apt-get install -y pkg-config
apt-get install -y python-numpy python-dev
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev
apt-get -qq install libopencv-dev checkinstall pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2 libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils
