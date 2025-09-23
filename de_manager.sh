#!/usr/bin/env bash
# File: de_manager.sh
# Interactive installer/remover for Desktop Environments on Arch/CachyOS.
# Usage: bash de_manager.sh

set -euo pipefail
IFS=$'\n\t'

# Formatting (colors + bold)
BOLD='\033[1m'
RESET='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'

# Ensure colors are reset on exit
trap 'echo -ne "${RESET}"' EXIT

# Deterministic DE list (keeps menu order stable)
DE_LIST=(
  "KDE Plasma"
  "GNOME"
  "Xfce4"
  "bspwm"
  "Budgie"
  "Cinnamon"
  "Cosmic"
  "i3wm"
  "Hyprland"
  "LXDE"
  "LXQT"
  "MATE"
  "Openbox"
  "QTile"
  "Sway"
  "Wayfire"
  "UKUI"
)

declare -A deps
deps["KDE Plasma"]="ark bluedevil breeze-gtk cachyos-emerald-kde-theme-git cachyos-iridescent-kde cachyos-kde-settings cachyos-nord-kde-theme-git cachyos-themes-sddm char-white dolphin egl-wayland ffmpegthumbs filelight gwenview haruna kate kcalc kde-gtk-config kdeconnect kdegraphics-thumbnailers kdeplasma-addons kdialog kinfocenter kinit kio-admin konsole kscreen kwallet-pam kwalletmanager libplasma phonon-qt6-vlc plasma-browser-integration plasma-desktop plasma-firewall plasma-integration plasma-nm plasma-pa plasma-systemmonitor plasma-thunderbolt plasma-workspace plymouth-kcm powerdevil qt6-wayland sddm sddm-kcm spectacle xdg-desktop-portal xdg-desktop-portal-kde xsettingsd"
deps["GNOME"]="adwaita-icon-theme eog evince file-roller gdm gedit gnome gnome-backgrounds gnome-calculator gnome-control-center gnome-disk-utility gnome-keyring gnome-nettool gnome-power-manager gnome-screenshot gnome-shell gnome-terminal gnome-themes-extra gnome-tweaks gnome-usage malcontent libnma gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb nautilus sushi totem qt6-wayland xdg-user-dirs-gtk xdg-desktop-portal-gnome"
deps["Xfce4"]="blueman file-roller galculator gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings network-manager-applet parole ristretto thunar-archive-plugin thunar-media-tags-plugin xdg-user-dirs-gtk xed xfce4 xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-notifyd xfce4-pulseaudio-plugin xfce4-screensaver xfce4-screenshooter xfce4-taskmanager xfce4-wavelan-plugin xfce4-weather-plugin xfce4-whiskermenu-plugin xfce4-xkb-plugin"
deps["bspwm"]="cachyos-picom-config bspwm sxhkd polybar ly alacritty openssh"
deps["Budgie"]="budgie-control-center budgie-desktop budgie-desktop-view budgie-extras budgie-screensaver eog evince file-roller gedit gnome-keyring gnome-screenshot gnome-terminal gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter nemo nemo-fileroller nemo-preview network-manager-applet sushi totem xdg-user-dirs-gtk"
deps["Cinnamon"]="cinnamon system-config-printer gnome-keyring gnome-terminal blueberry metacity lightdm lightdm-gtk-greeter"
deps["Cosmic"]="cosmic-app-library cosmic-applets cosmic-bg cosmic-comp cosmic-files cosmic-greeter cosmic-icon-theme cosmic-launcher cosmic-notifications cosmic-osd cosmic-panel cosmic-player cosmic-randr cosmic-screenshot cosmic-session cosmic-settings cosmic-settings-daemon cosmic-terminal cosmic-text-editor cosmic-wallpapers cosmic-workspaces notification-daemon sddm xdg-desktop-portal-cosmic xorg-xwayland" # placeholder, package name may differ
deps["i3wm"]="cachyos-i3wm-settings cachyos-picom-config i3-wm i3blocks i3lock-color i3status rofi polybar ly dunst"
deps["Hyprland"]="cachyos-hyprland-settings hyprland kvantum qt5ct sddm swaybg swaylock-effects-git swaylock-fancy-git waybar xdg-desktop-portal-hyprland grimblast-git slurp mako wob pamixer rofi rofi-emoji wofi wlogout swappy uwsm wl-clipboard polkit-kde-agent bemenu bemenu-wayland xorg-xwayland capitaine-cursors kvantum-theme-nordic-git cachyos-nord-gtk-theme-git"
deps["LXDE"]="celluloid file-roller galculator gnome-screenshot gpicview gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lxappearance-gtk3 obconf-qt lxde-common lxde-icon-theme lxhotkey-gtk3 lxinput-gtk3 lxlauncher-gtk3 lxpanel-gtk3 lxrandr-gtk3 lxsession-gtk3 lxtask-gtk3 lxterminal lightdm lightdm-slick-greeter notification-daemon openbox pcmanfm-gtk3 lxmusic network-manager-applet xdg-user-dirs-gtk xed"
deps["LXQT"]="audiocd-kio baka-mplayer breeze breeze-gtk featherpad gvfs gvfs-mtp kio-fuse libstatgrab libsysstat lm_sensors lxqt lxqt-archiver network-manager-applet oxygen-icons pavucontrol-qt print-manager qt5-translations sddm xdg-utils xscreensaver xsettingsd"
deps["MATE"]="celluloid gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb lightdm lightdm-slick-greeter mate mate-extra network-manager-applet xdg-user-dirs-gtk"
deps["Openbox"]="cachyos-openbox-settings obconf-qt libwnck3 acpi arandr archlinux-xdg-menu dex dmenu dunst feh gtk-engine-murrine gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb jgmenu jq lightdm lightdm-slick-greeter lxappearance-gtk3 mpv network-manager-applet nitrogen openbox pasystray picom polkit-gnome rofi scrot slock sysstat thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tint2 ttf-nerd-fonts-symbols tumbler xbindkeys xcursor-neutral xdg-user-dirs-gtk xed xfce4-terminal"
deps["QTile"]="cachyos-qtile-settings ttf-nerd-fonts-symbols qtile ttf-cascadia-code wired rofi thunar polkit-gnome qt5ct noto-fonts flameshot gnome-themes-extra ttf-jetbrains-mono ttf-font-awesome picom ly"
deps["Sway"]="sway waybar wl-clipboard egl-wayland wayland-protocols wofi foot wmenu ly xorg-xwayland xdg-desktop-portal xdg-desktop-portal-wlr"
deps["Wayfire"]="cachyos-wayfire-settings wayfire-desktop-git egl-wayland wayland-protocols wofi ly xorg-xhost xorg-xwayland"
deps["UKUI"]="sddm thunar thunar-archive-plugin thunar-volman peony xfce4-terminal qt5-ukui-platformtheme ukui-biometric-auth ukui-control-center ukui-interface ukui-media ukui-menu ukui-menus ukui-notebook ukui-panel ukui-power-manager ukui-screensaver ukui-session-manager ukui-settings-daemon ukui-sidebar ukui-system-monitor ukui-themes ukui-wallpapers ukui-window-switch mate-terminal mate-system-monitor mate-control-center redshift gnome-screenshot accountsservice gvfs qt5-quickcontrols"

DEBUG="${DEBUG:-0}"

print_header() {
  clear
  echo -e "${BOLD}${CYAN}=== DE Manager (robust splitting) ===${RESET}"
  echo
}

print_de_list() {
  clear
  echo -e "${BOLD}Available Desktop Environments:${RESET}"
  local i=1
  for de in "${DE_LIST[@]}"; do
    echo -e "  ${CYAN}${i})${RESET} ${BOLD}${de}${RESET}"
    ((i++))
  done
  echo
}

pause() {
  read -rp $'\nPress Enter to return to the menu...' _dummy
}

deps_to_array() {
  local de_name=$1
  local -n _out_arr=$2  # name-ref to caller's array
  _out_arr=()
  # handle empty or unset
  local raw="${deps[$de_name]:-}"
  if [[ -z "$raw" ]]; then
    return 0
  fi
  mapfile -t _out_arr < <( printf '%s\n' "${raw}" | tr '[:space:]' '\n' | sed '/^$/d' )
}

install_de() {
  local de_name=$1
  local packages=()
  deps_to_array "$de_name" packages

  if [ ${#packages[@]} -eq 0 ]; then
    echo -e "${YELLOW}No dependencies configured for '${de_name}'.${RESET}"
    return
  fi

  $DEBUG && {
    echo -e "${MAGENTA}DEBUG packages array:${RESET}"
    for i in "${!packages[@]}"; do printf "  [%s] %q\n" "$i" "${packages[$i]}"; done
  }

  local missing=()
  echo -e "${BOLD}Checking packages for ${de_name}:${RESET}"
  for pkg in "${packages[@]}"; do
    # skip empty entries just in case
    [[ -z "${pkg// /}" ]] && continue
    if pacman -Q "$pkg" &>/dev/null; then
      echo -e "  ${YELLOW}[SKIP]${RESET} $pkg is already installed"
    else
      echo -e "  ${CYAN}[MISSING]${RESET} $pkg"
      missing+=("$pkg")
    fi
  done

  if [ ${#missing[@]} -eq 0 ]; then
    echo -e "${GREEN}[OK]${RESET} ${de_name} is already installed on your system."
    return
  fi

  echo -e "${BOLD}${CYAN}Installing missing packages:${RESET} ${missing[*]}"
  # install: each element is passed separately
  if sudo pacman -S --needed --noconfirm "${missing[@]}"; then
    echo -e "${GREEN}[SUCCESS]${RESET} Missing packages for ${de_name} installed."
  else
    echo -e "${RED}[ERROR]${RESET} Installation encountered errors. Check pacman output above."
  fi
}

check_dm_before_delete() {
  local de_name=$1
  local dm=""
  case "$de_name" in
    "KDE Plasma") dm="sddm" ;;
    "GNOME" | "Cosmic") dm="gdm" ;;
    "Cinnamon" | "Xfce4" | "MATE" | "Budgie" | "LXDE" | "LXQT" | "UKUI") dm="lightdm" ;;
    "bspwm" | "i3wm" | "Hyprland" | "Openbox" | "QTile" | "Sway" | "Wayfire") dm="" ;;
    # extend with others if needed
  esac

  if [[ -n "$dm" && $(pacman -Qq "$dm" 2>/dev/null) ]]; then
    echo -e "${RED}[WARNING]${RESET} You are about to remove the login manager: ${BOLD}$dm${RESET}"
    echo -e "Without a login manager, graphical login may not work."
    read -rp "Do you really want to remove $dm? (y/N): " confirm
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
      echo -e "${YELLOW}Cancelled deletion of $dm.${RESET}"
      return 1
    fi
  fi
  return 0
}

delete_de() {
  local de_name=$1
  local packages=()
  deps_to_array "$de_name" packages

  if [ ${#packages[@]} -eq 0 ]; then
    echo -e "${YELLOW}No dependencies configured for '${de_name}'.${RESET}"
    return
  fi

  if ! check_dm_before_delete "$de_name"; then
    return
  fi

  read -rp $'Are you sure you want to REMOVE all listed packages for '"${BOLD}${de_name}${RESET}"$'? (y/N): ' confirm
  if [[ ! "${confirm,,}" =~ ^y(es)?$ ]]; then
    echo -e "${YELLOW}Cancelled.${RESET}"
    return
  fi

  echo -e "${BOLD}${CYAN}Removing packages for ${de_name}:${RESET}"
  for pkg in "${packages[@]}"; do
    [[ -z "${pkg// /}" ]] && continue
    if pacman -Q "$pkg" &>/dev/null; then
      echo -e "  ${RED}[DEL]${RESET} Removing ${pkg}..."
      if sudo pacman -Rns --noconfirm "$pkg"; then
        echo -e "    ${GREEN}[OK]${RESET} ${pkg} removed"
      else
        echo -e "    ${RED}[ERR]${RESET} Failed to remove ${pkg}"
      fi
    else
      echo -e "  ${YELLOW}[SKIP]${RESET} ${pkg} is not installed"
    fi
  done

  echo -e "${GREEN}[DONE]${RESET} ${de_name} removal complete."
}

# Minimal interactive driver for quick testing
while true; do
  print_header
  echo -e "${BOLD}Available:${RESET}"
  for i in "${!DE_LIST[@]}"; do
    printf "  %s) %s\n" $((i+1)) "${DE_LIST[$i]}"
  done
  echo -e "\nq) Quit"
  read -rp $'\nChoose DE number (or q): ' choice
  [[ "${choice,,}" == "q" ]] && exit 0
  if ! [[ "$choice" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Invalid input.${RESET}"; sleep 1; continue
  fi
  if (( choice < 1 || choice > ${#DE_LIST[@]} )); then
    echo -e "${RED}Out of range.${RESET}"; sleep 1; continue
  fi
  selected="${DE_LIST[$((choice-1))]}"
  echo -e "\n1) Install  2) Delete  (b) back"
  read -rp "Action: " act
  case "${act,,}" in
    1) install_de "$selected"; sleep 1 ;;
    2) delete_de "$selected"; sleep 1 ;;
    b) continue ;;
    *) echo -e "${RED}Bad action.${RESET}"; sleep 1 ;;
  esac
  read -rp $'\nPress Enter to continue...' _dummy
done