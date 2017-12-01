#!/bin/bash

apt-get update

apt-get install -y build-essential
apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
apt-get install -y unzip wget
apt-get install -y openjdk-8-jdk ant