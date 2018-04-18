# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# adapt local definitions
if [ -f ~/.local.bash ]; then
	. ~/.local.bash
fi

# User specific environment and startup programs

#### START PATH settings ####
mkdir -p -m +x $HOME/bin
PATH=$HOME/bin:$PATH

if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -d ~/.pyenv ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [ -d ~/.exenv ]; then
    export PATH="$HOME/.exenv/bin:$PATH"
    eval "$(exenv init -)"
fi

if [ -d ~/.cargo ]; then
    export PATH="$HOME/.cargo/env:$PATH"
fi

# uniq PATH
_path=""
for _p in $(echo $PATH | tr ':' ' '); do
    case ":${_path}:" in
        *:"${_p}":* )
            ;;
        * )
            if [ "$_path" ]; then
                _path="$_path:$_p"
            else
                _path=$_p
            fi
            ;;
    esac
done

PATH=$_path

unset _p
unset _path
#### END PATH settings ####

# Display Git Branch name
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\e[38;5;110m\]\u@\h\e[38;5;252m\]:\e[38;5;150m\]\w\e[38;5;216m\]$(__git_ps1 " (%s)")\e[38;5;252m\]\n\$ '

# Color Settings
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export PROMPT_COMMAND="dispatch_hist"
shopt -s histappend
export PROMPT_COMMAND_HISTSAVE="history -a;"
