# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.local.bash ]; then
	. ~/.local.bash
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

# Git Completion
source ~/dotfiles/.git-prompt.sh
source ~/dotfiles/.git-completion.bash

# Display Git Branch name
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '
