# Modified from https://github.com/ufoym/deepo.git

FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04
ENV LANG C.UTF-8

RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --recursive" && \

    rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        build-essential \
        apt-utils \
        ca-certificates \
        wget \
        git \
        vim \
        libssl-dev \
        curl \
        unzip \
        unrar \
        && \

    $GIT_CLONE https://github.com/Kitware/CMake ~/cmake && \
    cd ~/cmake && \
    ./bootstrap && \
    make -j"$(nproc)" install && \

# ==================================================================
# python
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        software-properties-common \
        && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        python3.6 \
        python3.6-dev \
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \

# ==================================================================
# dependencies
# ------------------------------------------------------------------

    $PIP_INSTALL \
        cachetools \
        enum34 \
        fire \
        future \
        motmetrics \
        numba \
        numpy \
        opencv-python \
        pillow \
        protobuf \
        psutil \
        pybind11 \
        pyquaternion \
        pyyaml \
        seaborn \
        scikit-learn \
        scikit-image>=0.14.2 \
        scipy \
        setuptools \
        shapely \
        tqdm \
        typing \
        && \

# ==================================================================
# pytorch
# ------------------------------------------------------------------

    $PIP_INSTALL \
        torch==1.4 \
        torchvision==0.5 \
        tensorboardX \
        && \

# ==================================================================
# spconv
# ------------------------------------------------------------------

    DEBIAN_FRONTEND=noninteractive $APT_INSTALL \
        libsm6 libxext6 libxrender-dev \
        libboost-all-dev && \

    $GIT_CLONE https://github.com/traveller59/spconv.git \
        ~/spconv && \
    cd ~/spconv && \
    SPCONV_FORCE_BUILD_CUDA=1 \
    python setup.py bdist_wheel && \
    $PIP_INSTALL ~/spconv/dist/spconv-*.whl && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    cd && \
    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* \
        /tmp/* \
        ~/* \


ARG POINTPILLARS_ROOT=/root/pointpillars
ARG NUSCENES_ROOT=/root/nuscenes
ENV POINTPILLARS_ROOT=$POINTPILLARS_ROOT
ENV NUSCENES_ROOT=$NUSCENES_ROOT
ENV PYTHONPATH=$POINTPILLARS_ROOT/second.pytorch
ENV PYTHONPATH=$PYTHONPATH:$NUSCENES_ROOT/nuscenes-devkit/python-sdk

VOLUME ["$POINTPILLARS_ROOT", "$NUSCENES_ROOT"]
WORKDIR /root/

ENTRYPOINT ["bash"]

