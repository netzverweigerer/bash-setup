# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

### less / pager setup
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

### Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### bash prompt setup
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
else
  PS1='> '
fi

### bash functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi


# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if [ ! -e /etc/bash_completion ]; then
#     if [ -f /usr/share/bash-completion/bash_completion ]; then
#         source /usr/share/bash-completion/bash_completion
#     fi  
#     if [ -f /etc/bash_completion ]; then
#         . /etc/bash_completion
#     fi
# fi
# . /etc/bash_completion
### not needed if we run from /etc
# . /usr/share/bash-completion/bash_completion

# man pages: color
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;33m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# $PATH stuff
# include sbin stuff in PATH
if [ "$UID" != 0 ]; then PATH=$PATH:/sbin:/usr/local/sbin:/usr/sbin:/usr/libexec/; fi

# include ~/bin/ in $PATH if it exists
if [ -d ~/bin ]; then
    export PATH="$PATH:~/bin"
fi

# Disable annoying beeps and blinks (terminal bell)
# this uses three different methods to make sure we turn it all off...
# [screen] for screen use "vbell off" in screenrc (!).
set bell-style none
xset b off 2>/dev/null
set blength=0 >/dev/null 2>&1

# mkdircd, create a directory and cd into it in one single command
# function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

### force english / US locales
# export LC_CTYPE="en_US.UTF-8"
# export LC_NUMERIC="en_US.UTF-8"
# export LC_TIME="en_US.UTF-8"
# export LC_COLLATE="en_US.UTF-8"
# export LC_MONETARY="en_US.UTF-8"
# export LC_MESSAGES="en_US.UTF-8"
# export LC_PAPER="en_US.UTF-8"
# export LC_NAME="en_US.UTF-8"
# export LC_ADDRESS="en_US.UTF-8"
# export LC_TELEPHONE="en_US.UTF-8"
# export LC_MEASUREMENT="en_US.UTF-8"
# export LC_IDENTIFICATION="en_US.UTF-8"
# export LC_ALL="en_US.UTF-8"



# enable ** (bash 4 only)
shopt -s globstar

if [[ "$TERM" == "rxvt-unicode" ]]; then
    export TERM="rxvt-unicode-256color"
fi



