# CachyOS Desktop Environment Dependencies

> **Last verified: July 13, 2026**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

It provides the dependencies for all the Desktop Environments from the latest update of **CachyOS**. <br>
Flags to assist in Installing/Deleting a Desktop Environment: <br>
**-S**: To Search Dependencies. <br>
**-Rns**: To Remove Dependencies, including Orphaned Dependencies. <br>
<hr>

## Budgie:
```
sudo pacman -S budgie-control-center budgie-desktop budgie-desktop-view budgie-extras eog evince file-roller gedit gnome-keyring gnome-screenshot gnome-terminal gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter nemo nemo-fileroller network-manager-applet sushi totem xdg-user-dirs-gtk
```

## COSMIC:
```
sudo pacman -S cosmic-app-library cosmic-applets cosmic-bg cosmic-comp cosmic-files cosmic-greeter cosmic-icon-theme cosmic-launcher cosmic-notifications cosmic-osd cosmic-panel cosmic-player cosmic-randr cosmic-screenshot cosmic-session cosmic-settings cosmic-settings-daemon cosmic-terminal cosmic-text-editor cosmic-wallpapers cosmic-workspaces notification-daemon xdg-desktop-portal-cosmic xorg-xwayland
```

## Cinnamon:
```
sudo pacman -S cinnamon cinnamon-translations gnome-keyring gnome-terminal lightdm lightdm-gtk-greeter metacity system-config-printer
```

## GNOME:
```
sudo pacman -S file-roller fwupd gdm gedit gnome-backgrounds gnome-calculator gnome-console gnome-control-center gnome-disk-utility gnome-keyring gnome-nettool gnome-power-manager gnome-shell gnome-tweaks gnome-usage gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb libnma loupe malcontent papers showtime simple-scan sushi
```

## Hyprland:
```
sudo pacman -S dolphin hyprland kitty playerctl polkit-kde-agent sddm uwsm wl-clipboard wofi xdg-desktop-portal-hyprland xorg-xwayland
```

## KDE Plasma:
```
sudo pacman -S ark bluedevil breeze-gtk cachyos-emerald-kde-theme-git cachyos-iridescent-kde cachyos-kde-settings cachyos-nord-kde-theme-git cachyos-themes-sddm char-white dolphin ffmpegthumbs filelight fwupd gwenview haruna kate kcalc kde-gtk-config kdeconnect kdegraphics-thumbnailers kdeplasma-addons kdialog kinfocenter kio-admin konsole kscreen kwallet-pam kwalletmanager partitionmanager phonon-qt6-vlc plasma-browser-integration plasma-desktop plasma-firewall plasma-login-manager plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plymouth-kcm powerdevil spectacle xsettingsd
```

## LXDE:
```
sudo pacman -S celluloid file-roller galculator gnome-screenshot gpicview gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter lxappearance lxde lxde-icon-theme lxmusic lxterminal network-manager-applet notification-daemon obconf-qt openbox pcmanfm xdg-user-dirs-gtk xed
```

## LXQT:
```
sudo pacman -S audiocd-kio baka-mplayer breeze breeze-gtk featherpad gvfs gvfs-mtp kio-fuse libstatgrab libsysstat lm_sensors lxqt lxqt-archiver network-manager-applet oxygen-icons pavucontrol-qt print-manager qt5-translations sddm xdg-utils xscreensaver xsettingsd
```

## MATE:
```
sudo pacman -S celluloid gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter mate mate-extra network-manager-applet xdg-user-dirs-gtk
```

## Niri:
```
sudo pacman -S cachyos-niri-noctalia sddm
```

## Openbox:
```
sudo pacman -S acpi arandr archlinux-xdg-menu dex dmenu dunst feh gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb jgmenu jq libwnck3 lightdm lightdm-slick-greeter lxappearance mpv network-manager-applet obconf-qt openbox pasystray picom polkit-gnome rofi scrot slock sysstat thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tint2 ttf-nerd-fonts-symbols tumbler xbindkeys xcursor-neutral xdg-user-dirs-gtk xed xfce4-terminal
```

## QTile:
```
sudo pacman -S cachyos-qtile-settings flameshot gnome-themes-extra ly noto-fonts picom polkit-gnome qt5ct qtile rofi thunar ttf-cascadia-code ttf-font-awesome ttf-jetbrains-mono ttf-nerd-fonts-symbols wired xorg-server xorg-xinit xorg-xrandr
```

## Sway:
```
sudo pacman -S egl-wayland foot ly sway waybar wayland-protocols wl-clipboard wmenu wofi xdg-desktop-portal xdg-desktop-portal-wlr xorg-xwayland
```

## UKUI:
```
sudo pacman -S accountsservice gnome-screenshot gvfs mate-control-center mate-system-monitor mate-terminal peony qt5-quickcontrols qt5-ukui-platformtheme redshift sddm thunar thunar-archive-plugin thunar-volman ukui-biometric-auth ukui-control-center ukui-interface ukui-media ukui-menu ukui-menus ukui-notebook ukui-panel ukui-power-manager ukui-screensaver ukui-session-manager ukui-settings-daemon ukui-sidebar ukui-system-monitor ukui-themes ukui-wallpapers ukui-window-switch xfce4-terminal
```

## Wayfire:
```
sudo pacman -S cachyos-wayfire-settings egl-wayland ly wayfire-desktop-git wayland-protocols wofi xorg-xhost xorg-xwayland
```

## Xfce4:
```
sudo pacman -S blueman file-roller galculator gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings network-manager-applet parole ristretto thunar-archive-plugin thunar-media-tags-plugin xdg-user-dirs-gtk xed xfce4 xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-taskmanager xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin
```

## bspwm:
```
sudo pacman -S alacritty bspwm cachyos-picom-config ly openssh polybar sxhkd xorg-server xorg-xinit xorg-xrandr
```

## i3wm:
```
sudo pacman -S cachyos-i3wm-settings cachyos-picom-config dunst i3-wm i3blocks i3lock-color i3status ly polybar rofi xorg-server xorg-xinit xorg-xrandr
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to report issues, submit changes, and understand the repo structure.