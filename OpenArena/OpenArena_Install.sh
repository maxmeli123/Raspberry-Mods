#!/bin/bash

echo "$(tput setaf 1)"
echo "   ____                                                  "
echo "  / __ \                     /\                          "
echo " | |  | |_ __   ___ _ __    /  \   _ __ ___ _ __   __ _  "
echo " | |  | | '_ \ / _ \ '_ \  / /\ \ | '__/ _ \ '_ \ / _\` | "
echo " | |__| | |_) |  __/ | | |/ ____ \| | |  __/ | | | (_| | "
echo "  \____/| .__/ \___|_| |_/_/    \_\_|  \___|_| |_|\__,_| "
echo "        | |                                              "
echo "        |_|                     Installer $(tput sgr0)   "
echo

echo
read -n 1 -s -r -p "Please, set your terminal to full screen and press any key to continue ... "

clear

echo
echo "*****************************************************************************************************"
echo "*                     WELCOME TO RASPBERRY PI OPENARENA AUTOMATED INSTALLER                         *"
echo "*                                                                                                   *"
echo "*                       Written by Massimo Meli (Italy) matrix20001@tin.it                          *"
echo "*****************************************************************************************************"
echo
echo "PLEASE TAKE SOME TIME TO READ BELOW BEFORE CONTINUE INSTALLATION."
echo
echo "THIS SCRIPT WILL INSTALL OPENARENA TO YOUR RASPBERRY PI."
echo
echo "IMPORTANT NOTES BEFORE INSTALLING IT:"
echo
echo "(1) Make sure you are connected to the network, this installer will download required packages from"
echo "    repositories."
echo "(2) Make sure you have at least 500MB free on your sdcard."
echo "(3) OpenArena need enabled OpenGL driver to work, this script check if you have it"
echo "    enabled, if enabled will continue installation, if not enabled, will launch the"
echo "    Raspberry Configuration, please go to the Advanced tab and enable OpenGL driver"
echo "    then press OK to reboot the system to take effect."
echo "    After reboot you can rerun this script to continue this installation." 
echo "(4) IF YOU DO NOT LONGER NEED OPENARENA YOU CAN SIMPLY EXECUTE THE PROVIDED UNINSTALLER SCRIPT THAT"
echo "    REMOVE COMPLETELY IT FROM YOUR SYSTEM."
echo

read -n 1 -s -r -p "Press any key to continue, you can Abort this installer on next step ... "

clear

echo
echo "NOTES FOR RASPBERRY 1, ZERO AND ZERO W USERS"
echo
echo "If you have Raspberry 1 or Zero or Zero W, it do not support OpenGL ES2 overlay driver you select from"
echo "raspi-config because do not have enough ram, so you can select an OpenGL ES2 driver from raspi-config,"
echo "but after this Raspberry don't want to boot. To fix this, you cam set Full OpenGL ES2 driver from"
echo "raspi-config (KMS), then edit your /boot/config.txt file by placing (, cma-64 or , cma-128) after the"
echo "dtoverlay=vc4-kms-v3d overlay as follow:"
echo
echo "dtoverlay=vc4-kms-v3d, cma-64"
echo
echo "Eventually you can try to experiment with different memory settings. Do not try Fake driver because do"
echo "not works and you will may have blank screen on boot."
echo
echo "Using this trick you can boot, but for effect of CMA it slow down a bit a normal desktop experience,"
echo "but OpenGL driver is enabled and you can launch applications that uses it."
echo
echo "If you find a best solution to this, please send me an email, so I can improve this script. Many thanks!"
echo

read -p "Do you want install OpenArena (y-Y or n-N) ? " choice
case "$choice" in
        y|Y ) echo;;
        n|N ) echo
              echo "Install Aborted."
              echo
              exit 1;;
        * ) echo
            echo "Invalid choice. You need to press 'y-Y' or 'n-N' to the prompt." 
            echo "Any other key we assume you Aborted. Bye."
            echo
            exit 1;;
esac

clear

echo
# Call raspi-config if OpenGL driver is disabled
if grep --quiet '^dtoverlay=vc4-kms-v3d' /boot/config.txt ; then
   echo " -------- You have (Full) OpenGL Desktop driver already enabled (KMS) -  dtoverlay=vc4-kms-v3d"
   echo " -------- We skip to launch Raspberry Configuration and go to the next step."
   echo
   glxinfo | grep -i render
   echo
elif grep --quiet '^dtoverlay=vc4-fkms-v3d' /boot/config.txt ; then
   echo " -------- You have (Fake) OpenGL Desktop driver already enabled (FKMS) -  dtoverlay=vc4-fkms-v3d"
   echo " -------- We skip to launch Raspberry Configuration and go to the next step."
   echo
   glxinfo | grep -i render
   echo
else
   echo "* The OpenGL Desktop driver is disabled, now we launch the Raspberry Configuration, please activate it"
   echo "* on Advanced Options, you can select (KMS) or (FKMS) depending on your device as for instructions."
   echo
   echo "After you selected and enabled the driver, reboot your Raspberry by pressing OK on the prompt message."
   echo
   echo "After reboot restart this installer to continue OpenArena installation."
   echo
   echo "NOTE: As for instructions, if you have RPI 1 or Zero or Zero W, before reboot"
   echo "      you need to edit the /boot/config.txt file to add CMA to the OpenGL overlay."
   echo
   read -n 1 -s -r -p "Press any key to continue ... "
   clear
   sudo raspi-config
   echo "Mmmmmm you selected OK to reboot ???  If no but you enabled OpenGL driver, just reboot manually and"
   echo "after reboot restart this installer to continue OpenArena installation."
   exit 1
fi

echo
echo "-------- Download and Install --------"
echo
sudo apt install openarena openarena-server -y

echo # Set mode (Full KMS should have been enabled) Choose 1920x1080, 1680x1050, 1280x1024, 1440x900, 1280x960, 1280x720, 1024x768, 800x600, 720x576, 720x480, 640x480
echo "Set resolution to 1280x720 on HDMI-1 by default."
echo "Note: on Launcher script you can choose the resolution and edit the script to use touchscreen."
echo

sleep 10s

xrandr --output HDMI-1 --mode 1280x720

echo # Start the game in full screen mode using OpenGL render
echo "Start OpenArena in full screen mode using OpenGL render."
echo
echo "Enjoy with OpenArena :D"
echo

sudo apt clean

sleep 8s

openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1280 +set r_customheight 720 +set r_fullscreen 1 +set cg_drawFPS 1




