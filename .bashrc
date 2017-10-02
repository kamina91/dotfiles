# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
case "${OSTYPE}" in
    darwin*)
        alias ls="ls -G"
        alias ll="ls -alG"
        ;;
    linux*)
        alias ls='ls --color'
        alias ll='ls -al --color'
        ;;
esac
alias vi='vim'
alias vhdir='cd /etc/httpd/conf.d/'
alias webdir='cd /var/www/html/'
alias rs='sudo apachectl restart'
alias sudoenv='sudo -u ${USER} -i'
#alias grep='grep --color -rnIie'
alias rmswp='find -name '*.swp' | xargs rm'

# [git alias] aliases
alias gco='git co'
alias gbr='git br'
alias gst='git st'
alias gcm='git cm'
alias gps='git ps'
alias gpl='git pl'
alias gdf='git df'
alias gad='git ad'

# Git Completion
source ~/dotfiles/.git-prompt.sh
source ~/dotfiles/.git-completion.bash
