configDirs=(
  "kitty"
  "nvim"
  "waybar"
  "fuzzel"
  "hypr"
  "btop"
  "tmux"
  "alacritty"
  "zellij"
  "nushell"
  "starship.toml"
)

for dir in ${configDirs[@]}; do
  rm -r $HOME/.config/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME/.config
done

hiddenHomeDirs=(
  ".gitconfig"
  ".m2"
  "npmrc"
)

for dir in ${hiddenHomeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/hidden/$dir $HOME
done

homeDirs=(
  ".zshrc"
  ".westerm.lua"
)

for dir in ${homeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME
done

echo "Done linking dotfiles"
