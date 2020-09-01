FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
 apt install -y wget gcc make cmake g++ git \
        valgrind libboost-all-dev language-pack-en-base libboost-python-dev python3-dev \
	sshpass\
	clang-tidy clang python-yaml fontconfig python3-pip\
 && rm -rf /var/lib/apt/lists/* 
RUN apt-get update && \
    apt-get install -y qt5-qmake qt5-default libqt5charts5 libqt5charts5-dev openssh-client && \
    apt-get clean && \
    strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5 && \
    rm -rf /var/lib/apt/lists/*
    
RUN apt update && apt install -y libopenblas-base libsuperlu-dev && \
    wget -q -O worhp_1.14-0~ubuntu2004.deb https://seafile.zfn.uni-bremen.de/f/0171f8b47c114aa282a5/?dl=1 && \
    chmod +x worhp_1.14-0~ubuntu2004.deb && apt-get install -y ./worhp_1.14-0~ubuntu2004.deb
RUN pip3 install conan
ENV LANG en_US.utf-8
