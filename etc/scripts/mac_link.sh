configsDirs=(
  "kitty"
  "nvim"
  "skhd"
  "yabai"
  "btop"
  "tmux"
  "alacritty"
  "zellij"
  "nushell"
  "starship.toml"
)

for dir in ${configsDirs[@]}; do
  rm -r $HOME/.config/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME/.config
done

homeDirs=(
  ".zshrc"
  ".westerm.lua"
)

for dir in ${homeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME
done

hiddenHomeDirs=(
  ".gitconfig"
  "npmrc"
  ".m2"
)

for dir in ${hiddenHomeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/hidden/$dir $HOME
done


echo "Done linking dotfiles"
