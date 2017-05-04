#-----This is the original OSX content-----
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad
#------------------------------------------

# Include .bashrc if it exists.
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

# set PATH so it includes toolbox (my private bin)
if [ -d "$HOME/toolbox" ] ; then
    PATH="$HOME/toolbox:$PATH"
fi
