Automated installer and launcher scripts for the first-person shooter game OpenArena.

The installer download and install OpenArena from Official Raspberry Repositories (make sure you have at least 500MB free on sdcard and you are connected to the network).

The launcher tell you to run OpenArena by selecting resolution.

Before run these scripts you need to set permissons with:

sudo chmod +x ./OpenArena_Install
sudo chmod +x ./OpenArena_Run

Then you can run run scripts by terminal with:

./OpenArena_Install.sh
./OpenArena_Run.sh

or just put 'OpenArena.desktop' shortcut on your desktop, edit it with a text editor by putting the right paths for "Icon" and "Exec", then you can run just by doubleclick it.

As for other games OpenArena need OpenGL driver enabled, the installer automatically check if you have it already enabled, if not enabled launch raspi-config for you, after you enabdled it you have to reboot and then rerun the installer to continue installation.

Enjoy
