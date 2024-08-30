# NOTE: remember to enable multilib in /etc/pacman.conf
aur_packages=(
  "flutter"
  "bottles"
  "android-studio"
  "google-chrome"
  "cava"
  "waybar-module-pacman-updates-git"
  "fnm"
  "python-detect-secrets"
  "hyprshot"
  "surfshark-client"
)

for i in "${aur_packages[@]}"; do
  paru -S --needed $i
done

uninstall_packages=(
)

for i in "${uninstall_packages[@]}"; do
  paru -Rncs $i
done
