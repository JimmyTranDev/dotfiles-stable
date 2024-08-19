{pkgs, ...}: {
  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Programs
    git
    kitty
    neovim
    zsh
    btop
    vlc
    qbittorrent
    discord
    thunderbird
    gparted
    google-chrome
    bottles
    yazi

    # Hyprland
    waybar
    swaynotificationcenter
    hyprlock
    hyprpaper
    # hyprcursor
    fuzzel

    # Utils
    unzip
    wl-clipboard
    wget
    curl
    neofetch
    tree
    samba
    # sqlite
    lxqt.lxqt-policykit
    killall

    # yazi
    fzf
    ripgrep
    jq
    poppler
    fd
    ffmpegthumbnailer
    p7zip
    zoxide
    imagemagick

    # Fonts
    nerdfonts

    # Programming Languages
    go
    python3
    zulu17
    nodejs_20
    clang
    cargo
    rustc
    alejandra
    lua-language-server
    # flutter
    # android-studio
    # android-tools
  ];
}
