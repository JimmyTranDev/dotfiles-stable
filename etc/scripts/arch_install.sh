packages=(
  # Programs
  "vim"
  "git"
  "neovim"
  "zsh"
  "btop"
  "vlc"
  "qbittorrent"
  "discord"
  "thunderbird"
  "gparted"
  "yazi"
  "nushell"
  "starship"
  "firefox"
  "kitty"
  "tmux"
  "zellij"
  "alacritty"

  # Utils
  "unzip"
  "wget"
  "base-devel"
  "neofetch"
  "sqlite"
  "wl-clipboard"
  "samba"
  "ntfs-3g"
  "tree"
  "avahi"
  "github-cli"
  # "bluez"
  # "bluez-utils"

  # Hyprland
  "plasma-meta"
  "plasma-workspace"
  "xorg-xhost"
  "nautilus"
  "nautilus-share"
  "hyprland"
  "waybar"
  "swaync"
  "hyprpaper"
  "hyprlock"
  "hyprcursor"
  "fuzzel"
  "openssh"
  "polkit"
  "polkit-kde-agent"

  # Yazi
  "fzf"
  "ripgrep"
  "jq"
  "poppler"
  "fd"
  "ffmpegthumbnailer"
  "p7zip"
  "zoxide"
  "imagemagick"

  # Fonts
  "nerd-fonts"
  "noto-fonts-cjk"
  "noto-fonts-emoji"
  "noto-fonts-extra"

  # Nvidia 
  "nvidia" 
  "nvidia-utils" 
  "lib32-nvidia-utils"
  "nvidia-settings"

  # Languages
  "go"
  "python"
  "python-pip"
  "python-pyquery"
  "jdk17-openjdk"
  "rust"
  "luarocks"
)

sudo pacman -Syu
for i in "${packages[@]}"; do
  sudo pacman -S --needed $i
done
