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

# Git Completion
source ~/dotfiles/.git-prompt.sh
source ~/dotfiles/.git-completion.bash

# Display Git Branch name
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '
