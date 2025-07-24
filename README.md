# Desktop Environment Dependencies
This Repository provides the dependencies for all the Desktop Environments from CachyOS (excluding UKUI). Note that everything here is Arch. Copy and paste the code of any Desktop Environment in the terminal to install those dependencies.

## KDE Plasma
```
sudo pacman -S ark bluedevil breeze-gtk cachyos-emerald-kde-theme-git cachyos-iridescent-kde cachyos-kde-settings cachyos-nord-kde-theme-git cachyos-themes-sddm char-white dolphin egl-wayland ffmpegthumbs filelight gwenview haruna kate kcalc kde-gtk-config kdeconnect kdegraphics-thumbnailers kdeplasma-addons kdialog kinfocenter kinit kio-admin konsole kscreen kwallet-pam kwalletmanager libplasma phonon-qt6-vlc plasma-browser-integration plasma-desktop plasma-firewall plasma-integration plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plasma-workspace plymouth-kcm powerdevil qt6-wayland sddm sddm-kcm spectacle xdg-desktop-portal xdg-desktop-portal-kde xsettingsd
```
## GNOME Desktop
```
sudo pacman -S adwaita-icon-theme eog evince file-roller gdm gedit gnome gnome-backgrounds gnome-calculator gnome-control-center gnome-disk-utility gnome-keyring gnome-nettool gnome-power-manager gnome-screenshot gnome-shell gnome-terminal gnome-themes-extra gnome-tweaks gnome-usage malcontent libnma gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb nautilus sushi totem qt6-wayland xdg-user-dirs-gtk xdg-desktop-portal-gnome
```
## Xfce4
```
sudo pacman -S blueman file-roller galculator gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings network-manager-applet parole ristretto thunar-archive-plugin thunar-media-tags-plugin xdg-user-dirs-gtk xed xfce4 xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-taskmanager xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin
```
## bspwm
```
sudo pacman -S cachyos-picom-config bspwm sxhkd polybar ly alacritty openssh
```
## Budgie
```
sudo pacman -S budgie-control-center budgie-desktop budgie-desktop-view budgie-extras budgie-screensaver eog evince file-roller gedit gnome-keyring gnome-screenshot gnome-terminal gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter nemo nemo-fileroller nemo-preview network-manager-applet sushi totem xdg-user-dirs-gtk
```
## Cinnamon
```
sudo pacman -S cinnamon system-config-printer gnome-keyring gnome-terminal blueberry metacity lightdm lightdm-gtk-greeter
```
## Cosmic
```
sudo pacman -S cosmic-app-library cosmic-applets cosmic-bg cosmic-comp cosmic-files cosmic-greeter cosmic-icon-theme cosmic-launcher cosmic-notifications cosmic-osd cosmic-panel cosmic-player cosmic-randr cosmic-screenshot cosmic-session cosmic-settings cosmic-settings-daemon cosmic-terminal cosmic-text-editor cosmic-wallpapers cosmic-workspaces notification-daemon sddm xdg-desktop-portal-cosmic xorg-xwayland
```
## i3wm
```
sudo pacman -S cachyos-i3wm-settings cachyos-picom-config i3-wm i3blocks i3lock-color i3status rofi polybar ly dunst
```
## Hyprland
```
sudo pacman -S cachyos-hyprland-settings hyprland kvantum qt5ct sddm swaybg swaylock-effects-git swaylock-fancy-git waybar xdg-desktop-portal-hyprland grimblast-git slurp mako wob pamixer rofi rofi-emoji wofi wlogout swappy uwsm wl-clipboard polkit-kde-agent bemenu bemenu-wayland xorg-xwayland capitaine-cursors kvantum-theme-nordic-git cachyos-nord-gtk-theme-git
```
## LXDE Desktop
```
sudo pacman -S celluloid file-roller galculator gnome-screenshot gpicview gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lxappearance-gtk3 obconf-qt lxde-common lxde-icon-theme lxhotkey-gtk3 lxinput-gtk3 lxlauncher-gtk3 lxpanel-gtk3 lxrandr-gtk3 lxsession-gtk3 lxtask-gtk3 lxterminal lightdm lightdm-slick-greeter notification-daemon openbox pcmanfm-gtk3 lxmusic network-manager-applet xdg-user-dirs-gtk xed
```
## LXQT Desktop
```
sudo pacman -S audiocd-kio baka-mplayer breeze breeze-gtk featherpad gvfs gvfs-mtp kio-fuse libstatgrab libsysstat lm_sensors lxqt lxqt-archiver network-manager-applet oxygen-icons pavucontrol-qt print-manager qt5-translations sddm xdg-utils xscreensaver xsettingsd
```
## MATE Desktop
```
sudo pacman -S celluloid gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter mate mate-extra network-manager-applet xdg-user-dirs-gtk
```
## Openbox
```
sudo pacman -S cachyos-openbox-settings obconf-qt libwnck3 acpi arandr archlinux-xdg-menu dex dmenu dunst feh gtk-engine-murrine gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb jgmenu jq lightdm lightdm-slick-greeter lxappearance-gtk3 mpv network-manager-applet nitrogen openbox pasystray picom polkit-gnome rofi scrot slock sysstat thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tint2 ttf-nerd-fonts-symbols tumbler xbindkeys xcursor-neutral xdg-user-dirs-gtk xed xfce4-terminal
```
## Qtile
```
sudo pacman -S cachyos-qtile-settings ttf-nerd-fonts-symbols qtile ttf-cascadia-code wired rofi thunar polkit-gnome qt5ct noto-fonts flameshot gnome-themes-extra ttf-jetbrains-mono ttf-font-awesome picom ly
```
## Sway
```
sudo pacman -S sway waybar wl-clipboard egl-wayland wayland-protocols wofi foot wmenu ly xorg-xwayland xdg-desktop-portal xdg-desktop-portal-wlr
```
## Wayfire
```
sudo pacman -S cachyos-wayfire-settings wayfire-desktop-git egl-wayland wayland-protocols wofi ly xorg-xhost xorg-xwayland
```
