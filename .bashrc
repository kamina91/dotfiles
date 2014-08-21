# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ll='ls -alg --color=auto'
alias ls='ls --color=auto'
alias vi='vim'
alias comdir='cd /var/www/html/vorkers.com/'
alias vhdir='cd /etc/httpd/conf.d/'

# Git Completion
source /usr/local/git/contrib/completion/git-prompt.sh
source /usr/local/git/contrib/completion/git-completion.bash

# Display Git Branch name
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '
