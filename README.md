| Supported Targets | ESP32 | ESP32-C2 | ESP32-C3 | ESP32-C5 | ESP32-C6 | ESP32-C61 | ESP32-H2 | ESP32-P4 | ESP32-S2 | ESP32-S3 | Linux |
| ----------------- | ----- | -------- | -------- | -------- | -------- | --------- | -------- | -------- | -------- | -------- | ----- |

# ESP32 LED Blinking Example (with Go Language Library Integration)

This is an ESP32 LED blinking example project demonstrating how to integrate a TinyGo-compiled Go language static library within the ESP-IDF framework. The project implements basic LED control functionality and calls mathematical operation functions written in Go.

## Features

- ✨ LED blinking control (configurable GPIO pin)
- 🔧 Integration of TinyGo-compiled Go language static library
- 📊 Demonstrates cross-language programming with C calling Go functions
- ⚙️ Supports GPIO pin configuration via menuconfig
- 🎯 Based on FreeRTOS task scheduling

## Hardware Requirements

- ESP32 development board (supports all ESP32 series chips)
- USB cable (USB-A to Micro-USB or USB-C, depending on the board model)
- LED (optional, most development boards have one integrated)
- Computer running Windows, Linux, or macOS

## Software Environment Setup

### 1. Install ESP-IDF Development Framework

Please follow the official documentation to install ESP-IDF:

**Recommended Method: Via IDE**
- [VSCode Extension](https://marketplace.visualstudio.com/items?itemName=espressif.esp-idf-extension)
- [Eclipse Plugin](https://github.com/espressif/idf-eclipse-plugin)

**Manual Installation:**
- [Windows Installation Guide](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/windows-setup.html)
- [Linux and macOS Installation Guide](https://docs.espressif.com/projects/esp-idf/en/stable/esp32/get-started/linux-macos-setup.html)

### 2. Install TinyGo (Optional)

If you need to modify the Go code, please install TinyGo:

```bash
# macOS
brew tap tinygo-org/tools
brew install tinygo

# Linux
wget https://github.com/tinygo-org/tinygo/releases/download/v0.30.0/tinygo_0.30.0_amd64.deb
sudo dpkg -i tinygo_0.30.0_amd64.deb

# Windows
# Download and install from: https://github.com/tinygo-org/tinygo/releases
```

Starts a FreeRTOS task to print "Hello World".

(See the README.md file in the upper level 'examples' directory for more information about examples.)

## How to use example

Follow detailed instructions provided specifically for this example.

Select the instructions depending on Espressif chip installed on your development board:

- [ESP32 Getting Started Guide](https://docs.espressif.com/projects/esp-idf/en/stable/get-started/index.html)
- [ESP32-S2 Getting Started Guide](https://docs.espressif.com/projects/esp-idf/en/latest/esp32s2/get-started/index.html)


## Example folder contents

The project **hello_world** contains one source file in C language [hello_world_main.c](main/hello_world_main.c). The file is located in folder [main](main).

ESP-IDF projects are built using CMake. The project build configuration is contained in `CMakeLists.txt` files that provide set of directives and instructions describing the project's source files and targets (executable, library, or both).

Below is short explanation of remaining files in the project folder.

```
├── CMakeLists.txt
├── pytest_hello_world.py      Python script used for automated testing
├── main
│   ├── CMakeLists.txt
│   └── hello_world_main.c
└── README.md                  This is the file you are currently reading
```

For more information on structure and contents of ESP-IDF projects, please refer to Section [Build System](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-guides/build-system.html) of the ESP-IDF Programming Guide.

## Troubleshooting

* Program upload failure

    * Hardware connection is not correct: run `idf.py -p PORT monitor`, and reboot your board to see if there are any output logs.
    * The baud rate for downloading is too high: lower your baud rate in the `menuconfig` menu, and try again.

## Technical support and feedback

Please use the following feedback channels:

* For technical queries, go to the [esp32.com](https://esp32.com/) forum
* For a feature request or bug report, create a [GitHub issue](https://github.com/espressif/esp-idf/issues)

We will get back to you as soon as possible.

## Quick Start Guide

Follow these steps to build, flash, and monitor the project on your ESP32 development board:

1.  **Clone the repository:**

    ```bash
    git clone git@github.com:sunqirui1987/tinygo-esp32-demo.git
    cd tinygo-esp32-demo
    ```

2.  **Set up ESP-IDF environment variables:**

    Ensure your ESP-IDF environment variables are set up correctly. If you followed the manual installation, you might need to source the `export.sh` (Linux/macOS) or run `export.bat` (Windows) script from your ESP-IDF installation directory.

3.  **Navigate to the project directory:**

    ```bash
    cd /path/to/your/project/esp32-tinygo-blink
    ```

4.  **Configure the project (optional):**

    You can customize the LED GPIO pin and other settings using `menuconfig`:

    ```bash
    idf.py menuconfig
    ```

    Navigate to `Component config` -> `Blink Example Configuration` to change `BLINK_GPIO`.

5.  **Build the project:**

    ```bash
    idf.py build
    ```

    This command compiles the application and generates the necessary bootloader and partition table binaries.

6.  **Flash the project to your ESP32 board:**

    Connect your ESP32 development board to your computer via USB.

    ```bash
    idf.py -p /dev/ttyUSB0 flash
    ```

    Replace `/dev/ttyUSB0` with the actual serial port of your ESP32 board. You can usually find this in your system's device manager or by running `idf.py monitor` and looking for available ports.

7.  **Monitor the serial output:**

    After flashing, you can monitor the serial output to see the application running:

    ```bash
    idf.py -p /dev/ttyUSB0 monitor
    ```

    Press `Ctrl+]` to exit the monitor.
