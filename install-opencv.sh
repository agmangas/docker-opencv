#!/bin/bash

# Download opencv-2.4.13.4

wget https://github.com/opencv/opencv/archive/2.4.13.4.zip -O opencv-2.4.13.4.zip
unzip opencv-2.4.13.4.zip
cd opencv-2.4.13.4
mkdir release
cd release

# Compile and install

cmake -G "Unix Makefiles" \
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

ln -s /usr/local/python/2.7/cv2.so /usr/local/lib/python2.7/dist-packages/

# Echo OpenCV version

echo "OpenCV version:" $(python -c "import cv2; print(cv2.__version__);")

# Remove OpenCV sources folder

cd ../..
rm -fr opencv-2.4.13.4
rm opencv-2.4.13.4.zip
