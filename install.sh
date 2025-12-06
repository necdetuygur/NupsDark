#!/bin/bash

# sudo rm -rf ~/.icons/* && sudo rm -rf /usr/share/icons/* && sudo rm -rf ~/.themes/* && sudo rm -rf /usr/share/themes/*

CURRENT_DIR="$(pwd | tr 'A-Z' 'a-z')"
if [[ "$CURRENT_DIR" != *nupsdark* ]]; then
  git clone https://github.com/necdetuygur/NupsDark
  cd NupsDark
else
  git pull
fi

sudo cp -r ./icon/* /usr/share/icons/
sudo cp -r ./cursor/* /usr/share/icons/
sudo cp -r ./theme/* /usr/share/themes/
sudo cp -r ./font/* /usr/share/fonts/

sudo gtk-update-icon-cache -q /usr/share/icons/Papirus
sudo gtk-update-icon-cache -q /usr/share/icons/Papirus-Light
sudo gtk-update-icon-cache -q /usr/share/icons/Papirus-Dark

sudo fc-cache -f
xfconf-query --channel xsettings --property /Gtk/MonospaceFontName --set "JetBrains Mono NL Medium 10"
xfconf-query --channel xsettings --property /Gtk/FontName --set "Roboto Condensed 10"
xfconf-query --channel xsettings --property /Xft/Antialias --set 1
xfconf-query --channel xsettings --property /Xft/Hinting --set 1
xfconf-query --channel xsettings --property /Xft/HintStyle --set "hintslight"
xfconf-query --channel xsettings --property /Xft/RGBA --set "rgb"
xfconf-query --channel xfce4-terminal --property /general/use-system-font --set false
xfconf-query --channel xfce4-terminal --property /general/font --set "JetBrains Mono NL Medium 11"
xfconf-query --channel xfce4-terminal --property /general/line-space --set 1

xfconf-query --channel xsettings --property /Net/ThemeName --set "NupsDark"
xfconf-query --channel xsettings --property /Net/IconThemeName --set "Papirus-Dark"
xfconf-query --channel xsettings --property /Gtk/CursorThemeName --set "NupsDark"

xfwm4 --replace &
xfce4-panel --restart &

xfce4-appearance-settings &
xfce4-mouse-settings &

cd ..
