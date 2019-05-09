#!/bin/bash

echo "$(tput setaf 1)"
echo "   ____                                                  "
echo "  / __ \                     /\                          "
echo " | |  | |_ __   ___ _ __    /  \   _ __ ___ _ __   __ _  "
echo " | |  | | '_ \ / _ \ '_ \  / /\ \ | '__/ _ \ '_ \ / _\` | "
echo " | |__| | |_) |  __/ | | |/ ____ \| | |  __/ | | | (_| | "
echo "  \____/| .__/ \___|_| |_/_/    \_\_|  \___|_| |_|\__,_| "
echo "        | |                                              "
echo "        |_|                     Launcher $(tput sgr0)    "
echo

get_current_screen_resolution_string () {
    Original_Resolution_String=$(xrandr --current | grep '*' | awk '{print $1}')
    #Original_Resolution_String=$(xdpyinfo | awk '/dimensions/{print $2}')  
}    
    
get_current_screen_resolution () {
    #echo "get_current_screen_resolution"
    Cur_X_Res=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
    Cur_Y_Res=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
    get_current_screen_resolution_string
}

set_screen_resolution () {
   echo
	echo "Running OpenArena @ resolution $1"
	echo
	show_params
	echo
	
	sleep 3s
    
   if [ $FULL_SCREEN == 1 ] ; then
      #echo "xrandr --output $VIDEO_OUTPUT --mode $1"
      xrandr --output $VIDEO_OUTPUT --mode $1
   fi  
}

show_params () {
   #set_audio
   #echo "Current Width: $Cur_X_Res"
   #echo "Current Height: $Cur_Y_Res"
   echo "Full Screen: $FULL_SCREEN"
   echo "Show FPS: $SHOW_FPS"
}

#set_audio () {
    #echo "audio
   ##sudo modprobe snd-bcm2835
   ##amixer cset numid=3 1
#}

restore_resolution () {
	# Set original desktop resolution and quit the program
	echo
	echo "Restore original desktop resolution @ $Original_Resolution_String"
	echo
	sleep 3s
	xrandr --output $VIDEO_OUTPUT --mode $Original_Resolution_String	
}            

FULL_SCREEN=1
SHOW_FPS=1 
VIDEO_OUTPUT="HDMI-1"


PS3=$'\n''Please select resolution (12 to quit): '   # Choose 1920x1080, 1680x1050, 1280x1024, 1440x900, 1280x960, 1280x720, 1024x768, 800x600, 720x576, 720x480, 640x480
options=("1920x1080" "1680x1050" "1280x1024" "1440x900" "1280x960" "1280x720" "1024x768" "800x600" "720x576" "720x480" "640x480" "Quit")

select opt in "${options[@]}"
do
   if [ "$opt" != "Quit" ]; then
       get_current_screen_resolution
       set_screen_resolution $opt
   fi
    
	case $opt in
	"1920x1080")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1920 +set r_customheight 1080 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"1680x1050")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1680 +set r_customheight 1050 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"1280x1024")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1280 +set r_customheight 1024 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;    
	"1440x900")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1440 +set r_customheight 900 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"1280x960")
		#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1280 +set r_customheight 960 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;  
	"1280x720")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1280 +set r_customheight 720 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"1024x768")
		#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 1024 +set r_customheight 768 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"800x600")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 800 +set r_customheight 600 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"720x576")
		#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 720 +set r_customheight 576 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;   
	"720x480")
	#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 720 +set r_customheight 480 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;
	"640x480")
		#set_screen_resolution $opt
		openarena +set cl_renderer opengl1 +set r_mode -1 +set r_customwidth 640 +set r_customheight 480 +set r_fullscreen $FULL_SCREEN +set cg_drawFPS $SHOW_FPS
		;;       
	"Quit")
		restore_resolution
		break
		;;
     *) echo invalid option;;
    esac
done

#echo
#echo "Running OpenArena at resolution $opt"
#echo

#



