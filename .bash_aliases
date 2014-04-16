
### ls aliases
# alias ll='ls -al'
# alias ll='ls -l'
# alias la='ls -A'
# alias l='ls -CF'
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'

# enable color support of "ls" and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto --group-directories-first -F'
fi

### pacman aliases
alias pmi='echo "pacman install: "; sudo pacman -S'
alias pms='echo "pacman search: "; sudo pacman -Ss'
alias pmu='echo "pacman update: "; sudo pacman -Syyu'

# reboot / shutdown sudo aliases
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

# ncmpc wrapper
if [ -e ~/bin/ncmpc ]; then
    alias ncmpc='~/bin/ncmpc'
fi

# grep with color
alias grep='grep --color=auto'

# if vim is installed, let's use it at anytime instead of
# standard vi editor if using the "vi" command.
which vim >/dev/null 2>&1 && alias vi='vim' && export EDITOR='vim'

# screen aliases
alias sdr='screen -dr'
alias sx='screen -x'

# mutt: set terminal title
# alias mutt='PROMPT_COMMAND_SAVE="$PROMPT_COMMAND"; unset PROMPT_COMMAND; echo -en "\033]2;mutt: $USER@$(hostname)\007"; mutt; export PROMPT_COMMAND=$PROMPT_COMMAND_SAVE'

alias gpom='git push origin master'
alias gs='git status'
alias gl='git log'
alias gco='git commit'
alias gch='git checkout'
alias gr='git remote -v'
alias gb='git branch -a'
alias ga='git add .'

alias rex="/usr/bin/site_perl/rex"
alias rexify="/usr/bin/site_perl/rexify"

alias yaourt='yaourt --color=always'

