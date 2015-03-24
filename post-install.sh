# This script should be run just after a fresh install of
# Debian/Debian-like systems.  Has been tested on Debian 6.0.3
# Squeeze.


# Please note: replace aptitude with apt-get for Ubuntu.  I am not
# aware of what is to be done with other Debian forks.  Apt-get should
# work, but then you can fall back to aptitude, for obvious reasons.
# =====================================================================


# Set apt proxy (OPTIONAL)

# echo "Acquire::http::proxy
# http://username:password@proxyURL:proxyport">/etc/apt/apt.conf.d/99proxy

aptitude update;

aptitude install emacs texlive-full gcc mplayer emms vlc apache2 openssh-server
aspell aspell-en nmap unrar-free acpi cheese flashplugin-nonfree
subversion git graphviz sudo ;


# Optional installations, based on the installation
# =================================================

# ***CONFIG FILES ARE AVAILABLE AT***
# http://pascal.iiit.ac.in/~bodhi/configs


# Essential tools
aptitude install make automake tar bzip2 cups screen wget ; 


# This will get a bare-minimum X(with Openbox) running

# aptitude install xserver-xorg xserver-xorg-core
# xserver-xorg-input-synaptics xserver-xorg-video-intel pm-utils
# openbox;



# This will set the rest of X fancy stuff needed

# aptitude install tint2 gmrun terminator iceweasel feh epdfview
# thunar alsa gstreamer0.10-plugins-base gstreamer0.10-plugins-good
# gstreamer0.10-x libgstreamer-plugins-base0.10-0 libgstreamer0.10-0
# lsb-release wvdial wicd wicd-gtk wicd-curses xbattbar usb-modeswitch
# usb-modeswitchdata

