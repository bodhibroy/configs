# creates symbolic links for my vimrc and .emacs
# This file should exist in ~/sys/configs
ln -sFv $(pwd)/dotemacs.el $HOME/.emacs
ln -sFv $(pwd)/vimrc $HOME/.vimrc
ln -sFv $(pwd)/i3 $HOME/.i3
ln -sFv $(pwd)/xmodmap $HOME/.xmodmap
ln -sFv $(pwd)/change-wallpaper.sh $HOME/.change-wallpaper.sh
