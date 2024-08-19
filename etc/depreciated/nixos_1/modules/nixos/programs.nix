{pkgs, ...}: {
  programs = {
    # nix-ld = {
    #   enable = true;
    #   libraries = with pkgs; [
    #     sqlite
    #   ];
    # };
    firefox = {
      enable = true;
    };
    adb = {
      enable = true;
    };
    hyprland = {
      # Install the packages from nixpkgs
      enable = true;
      # Whether to enable XWayland
      xwayland.enable = true;
    };
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      zsh-autoenv.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "colored-man-pages"
          "history"
          "sudo"
          "web-search"
          "copypath"
          "copyfile"
          "copybuffer"
          "dirhistory"
          "jsontools"
        ];
      };
    };
  };
}
