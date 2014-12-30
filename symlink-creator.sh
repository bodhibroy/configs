# creates symbolic links for my vimrc and .emacs
#This file should exist in ~/sys/configs
var=$(pwd)
echo $var
ln -s $var/dotemacs.el /home/bodhi/.emacs
ln -s $var/vimrc /home/bodhi/.vimrc
