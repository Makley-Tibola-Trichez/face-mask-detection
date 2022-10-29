FROM alpine:3.7

RUN apk add install build-essential
RUN apk add install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apk add install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# build opencv
RUN mkdir -p /opencv/build && cd /opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=OFF \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
    -D BUILD_EXAMPLES=ON .. && \
    make -j4 && make install && ldconfig



# set working directory
WORKDIR /notebooks

COPY /temp /notebooks