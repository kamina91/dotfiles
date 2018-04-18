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
    cygwin*)
        alias ls='ls --color'
        alias ll='ls -al --color'
        ;;
esac
alias vi='vim'
alias rmswp='find -name '*.swp' | xargs rm'
alias rmr='rm -r'

# [git alias] aliases
alias gco='git co'
alias gbr='git br'
alias gst='git st'
alias gcm='git cm'
alias gps='git ps'
alias gpl='git pl'
alias gdf='git df'
alias gad='git ad'
alias ggrep='git gr'

# [tmux]
alias ta='tmux attach'

# Git Completion
source ~/dotfiles/.git-prompt.sh
source ~/dotfiles/.git-completion.bash

dispatch_hist () {
  export EXIT_STATUS="$?"

  local f
  for f in ${!PROMPT_COMMAND_*}; do
    eval "${!f}"
  done
  unset f
}
