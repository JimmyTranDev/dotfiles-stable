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
  let selected_project = ls ~/Programming/ | select name | reject | to csv -n | fzf
  cd "$HOME/Programming/$selected_project"
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

$env.ARCHFLAGS = '-arch x86_64'
$env.MANPAGER = 'nvim +Man!'
$env.MANWIDTH = 999
$env.ZSH = "$HOME/.oh-my-zsh"
$env.PATH = "/opt/homebrew/opt/postgresql@16/bin:$PATH"
$env.ANDROID_HOME = "$HOME/Android/Sdk"
$env.MANPATH = "/usr/local/man:$MANPATH"
$env.LANG = en_US.UTF-8
$env.EDITOR = 'nvim'
