#!/bin/bash

# Download OpenCV sources

echo "## Downloading OpenCV"

wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip -O opencv-${OPENCV_VERSION}.zip
unzip opencv-${OPENCV_VERSION}.zip
cd opencv-${OPENCV_VERSION}
mkdir release
cd release

# Export JAVA_HOME

JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
echo "export JAVA_HOME=${JAVA_HOME}" >> /root/.bashrc
source /root/.bashrc

# Compile and install

echo "## Compiling OpenCV"

JAVA_HOME=${JAVA_HOME} cmake -G "Unix Makefiles" \
    -DCMAKE_CXX_COMPILER=/usr/bin/g++ \
    -DCMAKE_C_COMPILER=/usr/bin/gcc \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DWITH_TBB=ON \
    -DBUILD_NEW_PYTHON_SUPPORT=ON \
    -DWITH_V4L=ON \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DBUILD_EXAMPLES=ON \
    -DWITH_OPENGL=ON \
    -DBUILD_FAT_JAVA_LIB=ON \
    -DINSTALL_TO_MANGLED_PATHS=ON \
    -DINSTALL_CREATE_DISTRIB=ON \
    -DINSTALL_TESTS=ON \
    -DENABLE_FAST_MATH=ON \
    -DWITH_IMAGEIO=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_GSTREAMER=ON \
    ..

make all
make install

# Put cv2.so into the PYTHONPATH

echo "## Updating the PYTHONPATH"

ln -s /usr/local/python/2.7/cv2.so /usr/local/lib/python2.7/dist-packages/

# Echo OpenCV version

echo "OpenCV version:" $(python -c "import cv2; print(cv2.__version__);")

# Remove OpenCV sources folder

echo "## Removing OpenCV sources"

cd ../..
rm -fr opencv-${OPENCV_VERSION}
rm opencv-${OPENCV_VERSION}.zip
