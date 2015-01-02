# creates symbolic links for my vimrc and .emacs
#This file should exist in ~/sys/configs
var=$(pwd)
echo $var
ln -s $var/dotemacs.el $HOME/.emacs
ln -s $var/vimrc $HOME/.vimrc
