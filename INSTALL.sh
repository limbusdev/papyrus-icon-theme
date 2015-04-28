#!/bin/bash
# Installation script for Kawaiki-Icon-Theme

green='\033[0;32m'
NC='\033[0m' # No Color

echo ""
echo -e "${green}             ------------------------------${NC}"
echo -e "${green}              Papyrus Icon Theme Installer${NC}"
echo -e "${green}             ------------------------------${NC}"
echo ""

# Check if executing user has root-priviliges
ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Papyrus-Icon-Theme will be copied to $HOME/.icons. To make it available system-wide, run as root."
else
	echo "Papyrus-Icon-Theme will be copied to /usr/share/icons. To make it available for yourself only, run as standard-user"
fi

# Ask if process should be continued
read -p "Continue? [y/n]" ans

if [ "$ans" == "n" ]
then
    exit
fi

# this directory
basedir=$(pwd)
theme1="/Kawaiki-Only"
theme1source=$basedir$theme1
theme2="/papyrus-blue"
theme2source=$basedir$theme2
theme3="/papyrus-brown"
theme3source=$basedir$theme3
theme4="/papyrus-purple"
theme4source=$basedir$theme4
theme5="/papyrus-yellow"
theme5source=$basedir$theme5
theme6="/papyrus-green"
theme6source=$basedir$theme6
theme7="/papyrus-red"
theme7source=$basedir$theme7
theme8="/papyrus-orange"
theme8source=$basedir$theme8
theme9="/papyrus-gray"
theme9source=$basedir$theme9
theme10="/papyrus-sticker-blue"
theme10source=$basedir$theme10
theme11="/papyrus-sticker-green"
theme11source=$basedir$theme11
theme12="/papyrus-sticker-red"
theme12source=$basedir$theme12

existingKawaiki="~/.icons/Kawaiki-Only"
exisitingKawaikiRoot="/usr/share/icons/Kawaiki-Only"

# copy files, depending on user-rights

if [ "$UID" -ne "$ROOT_UID" ]
then
    mkdir ~/.icons
    if [ ! -d "$existingKawaiki" ]; then
    cp -r $theme1source ~/.icons/
    fi
    cp -r $theme2source ~/.icons/
    cp -r $theme3source ~/.icons/
    cp -r $theme4source ~/.icons/
    cp -r $theme5source ~/.icons/
    cp -r $theme6source ~/.icons/
    cp -r $theme7source ~/.icons/
    cp -r $theme8source ~/.icons/
    cp -r $theme9source ~/.icons/
    cp -r $theme10source ~/.icons/
    cp -r $theme11source ~/.icons/
    cp -r $theme12source ~/.icons/
else
    mkdir /usr/share/icons
    if [ ! -d "$existingKawaikiRoot" ]; then
    cp -r $theme1source /usr/share/icons/
    fi
    cp -r $theme2source /usr/share/icons/
    cp -r $theme3source /usr/share/icons/
    cp -r $theme4source /usr/share/icons/
    cp -r $theme5source /usr/share/icons/
    cp -r $theme6source /usr/share/icons/
    cp -r $theme7source /usr/share/icons/
    cp -r $theme8source /usr/share/icons/
    cp -r $theme9source /usr/share/icons/
    cp -r $theme10source /usr/share/icons/
    cp -r $theme11source /usr/share/icons/
    cp -r $theme12source /usr/share/icons/
fi

if [ ! -d "$existingKawaiki" ]; then
if [ ! -d "$existingKawaikiRoot" ]; then

# Copy XFCE specific icons
echo "Are you using XFCE? If using XFCE please type y,"
echo "otherwise battery icons will be too big. [y/n]"

xfcepath="/XFCE/status"
statuspath=$basedir$xfcepath
read xfce
if [ "$xfce" == "y" ]
  then
    if [ "$UID" -ne "$ROOT_UID" ]
      then
      cp -r $statuspath ~/.icons/Kawaiki-Only/
    else
      mkdir /usr/share/icons
      cp -r $statuspath /usr/share/icons/Kawaiki-Only/
    fi
fi

# customize theme installation

echo "Would you like to use specific theme-settings for your system?"
echo "Standard [s]"
echo "Ubuntu, dark panel [ud]"
echo "Ubuntu, light panel [ul]"
echo "Xubuntu [x]"

themeindex="/Theme-Index/standard/index.theme"

read theme
if [ "$theme" == "s" ]
    then echo "nothing will be changed"
    elif [ "$theme" == "ud" ]
        then themeindex="/Theme-Index/ubuntu-dark/index.theme"
    elif [ "$theme" == "ul" ]
        then themeindex="/Theme-Index/ubuntu-light/index.theme"
    elif [ "$theme" == "x" ]
        then themeindex="/Theme-Index/xubuntu-dark/index.theme"
    else echo "nothing will be changed"
fi

themeindexsrc=$basedir$themeindex

if [ "$UID" -ne "$ROOT_UID" ]
then
    cp $themeindexsrc ~/.icons/Kawaiki-Only/
else
    mkdir /usr/share/icons
    cp $themeindexsrc /usr/share/icons/Kawaiki-Only/
fi


echo "Is your GTK theme rather dark or bright?"
echo "Light [l] (fits Ubuntu Radiance)"
echo "Dark [d]"
echo "Ubuntu Ambience [u]"
echo "Xubuntu [x]"

brightness="/brightness/light/*"

read theme
if [ "$theme" == "l" ]
    then echo "nothing will be changed"
    elif [ "$theme" == "d" ]
        then brightness="/brightness/dark/*"
    elif [ "$theme" == "u" ]
        then brightness="/brightness/ubuntu-ambience/*"
    elif [ "$theme" == "x" ]
        then brightness="/brightness/xubuntu/*"
    else echo "nothing will be changed"
fi

brightnesssrc=$basedir$brightness

if [ "$UID" -ne "$ROOT_UID" ]
then
    cp -r $brightnesssrc ~/.icons/Kawaiki-Only/
else
    mkdir /usr/share/icons
    cp -r $brightnesssrc /usr/share/icons/Kawaiki-Only/
fi

fi
fi


echo "You can use Gnome/Unity Tweak Tool, to choose Papyrus-Icon-Theme."
echo "Thanks for installing! Please consider donating to this project."

exit










