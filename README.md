# Easy-IoT.Firmware_Development_Environment

## What is this repo about?

Firmware development environment used at Easy IoT. The target dev board in this example is B-L475E-IOT01A (https://www.st.com/en/evaluation-tools/b-l475e-iot01a.html). This dev env can be easily tailored to work with other STM32 MCUs.

This dev env leverages some very powerful tools, including:

- VSCode: Arguably the most popular text editor.

- Docker: A self-contained sandbox that can be tailored for various projects.

- CMake: Arguably the most popular build system for C/C++.

- OpenOCD: A free flashing & debugging tool.


## How to use it?

Follow the instructions online to install VSCode, Docker and Docker compose on your host machine. Open this repo in VSCode and run it in a remote container. (https://code.visualstudio.com/docs/remote/containers)

This dev env works in Windows, MacOS and Linux. Linux is recommended because:
- Docker runs way faster on Linux than on MacOS or Windows.
- Flashing the firmware seems to have an issue on non-linux based OS as Docker can't easily access the serial(USB) port from the container.
