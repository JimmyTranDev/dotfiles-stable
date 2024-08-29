configsDirs=(
  "kitty"
  "nvim"
  "skhd"
  "yabai"
  "btop"
  "nushell"
  "starship.toml"
  "yazi"
)

for dir in ${configsDirs[@]}; do
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
  "npmrc"
  ".m2"
)

for dir in ${hiddenHomeDirs[@]}; do
  rm $HOME/$dir 
  ln -s $HOME/Programming/dotfiles/src/nvim/lua/hidden/$dir $HOME
done


echo "Done linking dotfiles"
