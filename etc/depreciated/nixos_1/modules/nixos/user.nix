{pkgs, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh;
  users.users.jimmy = {
    isNormalUser = true;
    description = "Jimmy Tran";
    extraGroups = ["networkmanager" "wheel" "kvm" "adbusers"];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };
}
