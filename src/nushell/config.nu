alias ai = ~/Programming/dotfiles/etc/scripts/arch_install.sh
alias aa = ~/Programming/dotfiles/etc/scripts/arch_aur.sh
alias al = ~/Programming/dotfiles/etc/scripts/arch_link.sh
alias mi = ~/Programming/dotfiles/etc/scripts/mac_install.sh
alias ml = ~/Programming/dotfiles/etc/scripts/mac_link.sh
alias mr = yabai --restart-service & skhd --restart-service
alias azl = ~/Programming/dotfiles/etc/scripts/azure_login.sh
alias rb = sudo nixos-rebuild switch --flake ~/Programming/dotfiles/etc/nixos#default
alias fl = nix develop ~/Programming/dotfiles/etc/nixos/shells/flutter --command zsh
alias ll = ls -la

def select_project [] {
  let selected_project = ls -s ~/Programming/ | select name | reject | to csv -n | fzf
  cd $'~/Programming/($selected_project)'
  nvim
}

$env.config = {
  keybindings: [
    {
      name: select_project
      modifier: control
      keycode: char_f
      mode: emacs
      event: {
        send: executehostcommand
        cmd: "select_project"
      }
    }
  ]
}
