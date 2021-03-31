FROM ubuntu:20.04 as FIRMWARE_DEV_ENV

# Install required packages
RUN apt-get update && \
        apt-get install -y \
        git \
        curl \
        wget \
        # Tools
        stlink-tools \
        openocd \
        # Python3
        python3 \
        python3-pip \
        python3-serial \
        # Clang
        clang \
        clang-format \
        clang-tidy

# Python3 components
RUN pip3 install watchdog autopep8

# CMake
RUN mkdir cmake && \
        cd cmake && \
        wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0-Linux-x86_64.sh && \
        chmod +x cmake-3.20.0-Linux-x86_64.sh && \
        ./cmake-3.20.0-Linux-x86_64.sh --skip-license && \
        mv ./bin/* /usr/local/bin && \
        mv ./man/* /usr/local/man && \
        mv ./share/* /usr/local/share && \
        cd .. && \
        rm -rf cmake

# GCC-ARM-NONE-EABI
RUN apt-get install -y \
        libtinfo5 \
        libncurses5

RUN mkdir gcc-arm-none-eabi && \
        cd gcc-arm-none-eabi && \
        wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 && \
        tar xjf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2 -C /usr/share/ && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++ && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy && \
        ln -s /usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-objdump /usr/bin/arm-none-eabi-objdump && \
        cd .. && \
        rm -rf gcc-arm-none-eabi