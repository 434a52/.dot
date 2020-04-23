SYS_OS=`uname -a` # linux or mac
SHORT_HOSTNAME=`hostname -s`

# system aliases
if [[ "$SYS_OS" == 'Linux' ]]; then
    PATH="..LINUX PATH..."
    source ~/dotfiles/aliases.lx
else
    PATH="... MAC PATH..."
    source ~/dotfiles/aliases.mac
fi

# run host specific profile
if [[ -e ~/dotfiles/profile.$SHORT_HOSTNAME ]]; then
    source ~/dotfiles/profile.$SHORT_HOSTNAME
fi