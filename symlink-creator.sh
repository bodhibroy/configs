# creates symbolic links for my vimrc and .emacs
# This file should exist in ~/sys/configs
ln -sFv $(pwd)/dotemacs.el $HOME/.emacs
ln -sFv $(pwd)/vimrc $HOME/.vimrc
