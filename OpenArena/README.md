Automated installer and launcher scripts for the first-person shooter game OpenArena.


The installer download and install OpenArena from Official Raspberry Repositories (make sure you have at least 500MB free on sdcard and you are connected to the network).

The launcher tell you to run OpenArena by selecting resolution, for now it run in full screen mode, but you can change to window mode by edit the OpenArena_Run.sh script and set FULL_SCREEN variable to 0. By change HDMI-1 to DSI-1 output and add 800x480 screen  resolution it can work on official Raspberry touschscreen.

Before run these scripts you need to set permissions with:

sudo chmod +x script_name.sh

Then you can run scripts from terminal with:

./script_name.sh

or just put 'OpenArena.desktop' shortcut on your desktop, edit it with a text editor by putting the right paths for "Icon" and "Exec", then you can run just by doubleclick on it.

As for other games OpenArena need OpenGL driver enabled, the installer automatically check if you have it already enabled, if not, launch raspi-config for you, after you have enabled it, reboot and then rerun the installer to continue installation.

Tested on Raspberry 3B and Raspberry Zero W.

Please, let me know if this has worked for you and the Raspberry
model you used so I can improve it and fix bugs if any. Thanks

Enjoy
