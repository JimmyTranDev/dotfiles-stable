
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto      # update automatically without asking

zstyle ':omz:update' frequency 14

# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
  colored-man-pages 
  history 
  sudo 
  web-search 
  copypath
  copyfile 
  copybuffer 
  dirhistory
  jsontools
)

export ARCHFLAGS="-arch x86_64"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export GTK_THEME=catppuccin-mocha-blue-standard+default-dark 
# export ANDROID_HOME="$HOME/Android/Sdk"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ai='~/Programming/dotfiles/etc/scripts/arch_install.sh'
alias aa='~/Programming/dotfiles/etc/scripts/arch_aur.sh'
alias al='~/Programming/dotfiles/etc/scripts/arch_link.sh'
alias mu='~/Programming/dotfiles/etc/scripts/mac_install.sh'
alias ml='~/Programming/dotfiles/etc/scripts/mac_link.sh'
alias mr='yabai --restart-service & skhd --restart-service'
alias azl='~/Programming/dotfiles/etc/scripts/azure_login.sh'
alias rb='sudo nixos-rebuild switch --flake $HOME/Programming/dotfiles/etc/nixos#default'
alias fl='nix develop ~/Programming/dotfiles/etc/nixos/shells/flutter --command zsh'
alias ll="ls -la"
alias :q="exit"

##########################################################
# function yazi_media() {
#   yazi /run/media/jimmy/HDD\ 20TB/
# }
# zle -N yazi_media
# bindkey '^m' yazi_media

function select_project() {
  local selected_project=$(ls ~/Programming/ | fzf)
  echo | cd "$HOME/Programming/$selected_project"
  nvim
}

zle -N select_project   
bindkey '^f' select_project

function open_nvim() {
  nvim
}

zle -N open_nvim
bindkey '^n' open_nvim

function open_yazi() {
  yazi
}
zle -N open_yazi
bindkey '^y' open_yazi
##########################################################

if [ ! -d "/etc/nixos" ]; then
    ##########################################################
    source $ZSH/oh-my-zsh.sh
    ##########################################################
    export PATH=/opt/homebrew/bin:$PATH
    ##########################################################
    export PNPM_HOME="/Users/jimmy/Library/pnpm"
    case ":$PATH:" in
      *":$PNPM_HOME:"*) ;;
      *) export PATH="$PNPM_HOME:$PATH" ;;
    esac
    ##########################################################
    #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
    # ##########################################################
fi

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"
