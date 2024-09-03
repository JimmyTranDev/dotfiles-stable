if [ ! -d $HOME/.config ]; then
  mkdir $HOME/.config
fi

configDirs=(
  "kitty"
  "nvim"
  "waybar"
  "fuzzel"
  "hypr"
  "btop"
  "nushell"
  "starship.toml"
  "yazi"
)

for dir in ${configDirs[@]}; do
  rm -r $HOME/.config/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME/.config
done

homeDirs=(
  ".zshrc"
  ".tmux.conf"
)

for dir in ${homeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/src/$dir $HOME
done

hiddenHomeDirs=(
  ".gitconfig"
  ".m2"
  "npmrc"
)

for dir in ${hiddenHomeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/src/nvim/lua/hidden/$dir $HOME
done

echo "Done linking dotfiles"
