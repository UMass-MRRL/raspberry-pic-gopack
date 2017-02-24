# RaspberryPIC GoPack

The GoPack is a universal control/driver pack meant for rapid prototyping of mechatronic systems. 
It houses a Raspberry Pi Version 2 B, 16 bit PIC microcontroller, and has various analog and digital inputs and outputs. Programming the GoPack is done in MATLAB Simulink version 2015b, and sent wirelessly through the WLAN to the Raspberry Pi.

Last updated: 02/23/2017

## Raspberry Pi Setup: 

### 1) Installing support packages: (for starting from scratch)
The RaspberryPi boots off of an SD card with the MATLAB Support Package and operating system installed.  The MATLAB support packages and are downloaded in MATLAB, and written to the PI with a USB SD reader/writer. All remaining programming is done over wifi. The package can be found in MATLAB under Add-Ons drop-down. Choose install from internet, choose Raspberry Pi, check all packages available for Pi, and follow the instructions. You will be guided to install your micro SD card in the USB card reader, and install the Rapberry Pi OS “Raspbian” with Matlab support packages for the appropriate Pi model. GoPack V1.0 uses Pi 2 Model B. 
.  
### 2) Booting the Pi up:
Before booting the GoPack, install the SD card that you installed the Raspbian OS on connect any USB peripherals that will be needed before booting so that the RaspberryPi recognizes them. Boot the Pi by plugging in a micro USB power source.

### 3) WLAN setup: 
The easiest way to set up a WLAN on campus is to use a router connected to the PC used for MATLAB. You must boot the RaspberryPi with a mouse, keyboard, WIFI dongle and HDMI monitor to set up the WLAN to connect automatically. Have the PC hosting MATLAB connected to the router, and the router to the main ethernet. In the Pi Rasbian OS, select Menu>Preferences>Wifi Configuration. Here you setup your network. Scan for Networks and choose the WLAN that the main PC is connected to. Double click, enter the password security key and click Add then close the scan window. In wpa_gui click connect. It should connect at this time. Make note of the following: SSID, BSSID, and IP address.

Once the connection is setup, the following boot ups are done with only the peripherals needed, and it should connect to the WLAN automatically. For the GoPack, all you need is the wifi dongle. Now shutdown the Pi by going to Menu. When the green light on the PI stops flashing, unplug the keyboard and monitor, and reboot by disconnecting and connecting the micro USB power source. 

### 4) Connecting to Pi with SSH from the main computer: 
Now on the PC, you need to be able to log in via SSH to have access to the Pi command prompt over the WLAN. Here you can download an executable called “Putty” to do so. http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
Save the executable in an accessible location, you will use it frequently. 
Run Putty. Click connection on the tree, and change “Seconds between keepalives” to 30 in order to keep the connection from timing out. Click Session in the tree, type in the IP address, highlight defaulty and save. You can now click open, and it will save the IP for next time. If you get a security alert, click yes. The default username and password are pi and raspberry (note the password will not show in the command window). 

### 5) Installing GPIO Interface Library wiringPi
The driver blocks used for PWM, ADC and Encoder inputs use the library called wiringPi www.wiringpi.com. To install wiringPi, git must first be installed. 
Boot the Pi and establish a SSH connection. Type:

`sudo apt-get install git-core`

If any errors happen, reinstall raspbian through MATLAB for the most updated copy. You can now download wiringPi. 

`git clone https://github.com/UMass-MRRL/wiringPi-GoPack.git`

Note: If you download wiringPi from its original source (git://git.drogon.net/wiringPi), that’s the wrong version. If updating wiringPi, type:
```
cd wiringPi
git pull origin
```
Now build and install wiringPi:
```
cd wiringPi
./build
```

Shutting the Pi down:
When connected with SSH via Putty, type this to shut down safely.  

`sudo halt`

Click OK when Putty gives a fatal error, it thinks the connection has failed. Close Putty. 


## Using GoPack with MATLAB and Simulink

### 1) Install support package
In Matlab, find the Raspberry Pi support package by selecting "Get Hardware Support Packages" from the Add-Ons block on the ribbon in the main console. If downloaded separately, select the download folder for the "Download from Folder" option. Otherwise, find the "Simulink Support Package for Raspberry Pi Hardware" option and follow the instructions to download and install. You will need a micro-SD card reader for the PC with Simulink.

It is recommended that you familiarize yourself with the basics:
http://www.mathworks.com/help/supportpkg/raspberrypi/examples/getting-started-with-raspberry-pi-hardware.html

### 2) Configure Simulink to run models on Raspberry Pi hardware
For Simulink to run models on the Raspberry Pi, it must be configured to run on external hardware. Enter the "Configuration Parameters" dialog and locate the "Hardware Implementation" tab. "Raspberry Pi" should be available on the "Hardware board" dropdown menu. Set the IP address for the Host name, supply the username and password for the Raspberry Pi, and set the Build directory to "/home/pi".

In the Solver tab, set the Solver options to discrete and fixed-step. Set the desired control loop sample time in the "Fixed step size (fundamental sample time)" field in seconds. (i.e. input a value of 0.001 for a 1 ms sample time).

In the Simulink model window, type "inf" for the simulation time, and set the mode to "external".

To run a model on the Raspberry Pi to view data and adjust the model in real-time, press the 'play' arrow button. To send a model to the Raspberry Pi to run independently of the host PC, click "Deploy to Hardware" on the far right of the control bar.

The Simulink blocks included in this repository use the WiringPi library to access Raspberry Pi functions not included in the standard blocks included with the Mathworks toolbox - control over SPI communication specifically.

### 3) Configure Simulink for compatibility with WiringPi functions
WiringPi will not work unless you add “-lwiringPi” to the linker flags in the simulink makefile. To do this, in your simulink model, go to Model Properties->Model Properties->Callbacks->PreSaveFcn and add the line:

`set_param(gcs,'PostCodeGenCommand','setBuildArgs(buildInfo)');`

Make sure that setBuildArgs.m is included in the active directory. This file is included in the Simulink Scripting section of this repository.

### 4) Using GoPack s-Functions to handle sensors and actuators
Three Simulink s-Function blocks are provided to allow the Simulink model to access sensor readings and dictate actuator outputs. 

The "inputs_to_SPI_bytes" block converts float or integer inputs into bytes for serial transfer. This primarily means motor duty cycle or voltage input. It also formats requests for readings from specific sensors.

The "SPI" block simply performs an SPI transfer of the byte vector assembled by the previous block. The output is a byte vector of requested sensor readings, and loopback confirmation of the requested outputs.

The "SPI_bytes_to_outputs" block converts the received byte vector into float or integer values for the requested sensor readings and looped-back outputs. Depending on the amount of samples the sensor is configured to perform per Simulink loop, outputs corresponding with each separate sensor reading can be a vector containing multiple samples. Filtering, chronological arrangement of this data, or averaging are left to the user to perform with standard Simulink blocks as needed.

Note that a single sample delay function is required before the input to the serial transfer subsystem made up of these three blocks. The model will form an algebraic loop and will not run if the delay is not included.

It is recommended to use the provided PID position control model for reference. This controller was successfully tested with a Maxon EC30 motor using an ESCON 50/5 motor driver.
