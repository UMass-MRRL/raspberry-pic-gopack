# RaspberryPIC GoPack

The GoPack is a universal control/driver pack meant for rapid prototyping of mechatronic systems. 
It houses a Raspberry Pi Version 2 B, 16 bit PIC microcontroller, and has various analog and digital inputs and outputs. Programming the GoPack is done in MATLAB Simulink version 2015b, and sent wirelessly through the WLAN to the PI.

## Setup Notes: 

### 1) Installing support packages: (for starting from scratch)
The RaspberryPi boots off of an SD card with the MATLAB Support Package and operating system installed.  The MATLAB support packages and are downloaded in MATLAB, and written to the PI with a USB SD reader/writer. All remaining programming is done over wifi. The package can be found in MATLAB under Add-Ons drop-down. Choose install from internet, choose Raspberry Pi, check all packages available for Pi, and follow the instructions. You will be guided to install your micro SD card in the USB card reader, and install the Rapberry Pi OS “Raspbian” with Matlab support packages for the appropriate Pi model. GoPack V1.0 uses Pi 2 Model B. 
.  
### 2) Booting the Pi up:
Before booting the GoPack, install the SD card that you installed the Raspbian OS on connect any USB peripherals that will be needed before booting so that the RaspberryPi recognizes them. Boot the Pi by plugging in a micro USB power source.

### 3) WLAN setup: 
The easiest way to set up a WLAN on campus is to use a router connected to the PC used for MATLAB. You must boot the RaspberryPi with a mouse, keyboard, WIFI dongle and HDMI monitor to set up the WLAN to connect automatically. Have the PC hosting MATLAB connected to the router, and the router to the main ethernet. In the Pi Rasbian OS, select Menu>Preferences>Wifi Configuration. Here you setup your network. Scan for Networks and choose the WLAN that the main PC is connected to. GoPack V1.0 uses belkin.172. Double click, enter 4a46f67f (or the Password security key if using a different router) and click Add then close the scan window. In wpa_gui click connect. It should connect at this time. If the following are different, make note.
SSID: belkin.172
BSSID: ec:1a:59:2f:f1:72
IP address: 192.168.2.3
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

`git clone git://git.drogon.net/wiringPi`

Note: If you download wiringPi from github, that’s the wrong version. If updating wiringPi, type:
```
cd wiringPi
git pull origin
```
Now build and install wiringPi:
```
cd wiringPi
./build
```
Now add another library from github:
```
git clone https://github.com/tuna-f1sh/wiringPi-mcp4725
cd wiringPi-mcp4725
./build
```

**NOTE:**
WiringPi will not work unless you add “-lwiringPi” to the linker flags in the simulink makefile. To do this, in your simulink model, go to Model Properties->Model Properties->Callbacks->PreSaveFcn and add the line:

`set_param(gcs,'PostCodeGenCommand','setBuildArgs(buildInfo)');`

Make sure that setBuildArgs.m is included in the active directory.



Shutting the Pi down:
When connected with SSH via Putty, type this to shut down safely.  

`sudo halt`

Click OK when Putty gives a fatal error, it thinks the connection has failed. Close Putty. 


## Using GoPack with MATLAB and Simulink
It is recommended that you familiarize yourself  with the basics:
http://www.mathworks.com/help/supportpkg/raspberrypiio/examples/getting-started-with-matlab-support-package-for-raspberry-pi-hardware.html

Analog Input in MATLAB Scripting
http://www.mathworks.com/help/supportpkg/raspberrypiio/examples/analog-input-using-spi.html?refresh=true

pi_mcp3008

