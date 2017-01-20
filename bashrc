export TERM=xterm-256color
export TERMCAP=

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors ~/.dir_colors`"
    alias ls='/bin/ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

#Convenient hot key
#Tool usage
export EDITOR=vim
#export LANGUAGE=en
#export LANG=C
#export LC_MESSAGES=C
export BOOST_BUILD_PATH=~/tools/boost-build/

source ~/.git-completion.sh
source ~/.toolsrc

info_color='\e[38;5;41m'
git_color='\e[38;5;4m'
reset_color='\e[0m'
PS1=${info_color}'\u@[\h:\w] '${git_color}'$(__git_ps1 " (%s)")'${reset_color}'\n[\$]'
