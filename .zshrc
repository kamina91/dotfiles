# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

bindkey -e              # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定

setopt auto_pushd        # cd時にディレクトリスタックにpushdする
#setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
#setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }

# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
#autoload -U colors; colors
# git 関連
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' max-exports 7
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s' '%c' '%u'
zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s' '%c' '%u'

function echo_rprompt() {
    branch="$vcs_info_msg_2_"
    if [ -n "$vcs_info_msg_1_" ]; then
        repos=`print -nD "$vcs_info_msg_0_"`
        if [ -n "$vcs_info_msg_4_" ]; then # staged
            #branch="%F{green}($branch +)%f"
            branch="%F{red}($branch +)%f"
        elif [ -n "$vcs_info_msg_5_" ]; then # unstaged
            #branch="%F{red}($branch *)%f"
            branch="%F{red}($branch *)%f"
        else
            #branch="%F{blue}($branch)%f"
            branch="%F{yellow}($branch)%f"
        fi
    else
        branch=''
    fi
    print -n "$branch"
}

# 一般ユーザ時
tmp_prompt='%F{cyan}[%n %D{%m/%d %T}]%f '
tmp_prompt2='%F{cyan}_> %f'
tmp_rprompt='%F{green}[%~]%f `echo_rprompt`'
tmp_sprompt='%F{yellow}%r is correct? [Yes, No, Abort, Edit]:%f'

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt='%B%U${tmp_prompt}%u%b'
  tmp_prompt2='%B%U${tmp_prompt2}%u%b'
  tmp_rprompt='%B%U${tmp_rprompt}%u%b'
  tmp_sprompt='%B%U${tmp_sprompt}%u%b'
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT='%{${fg[white]}%}${HOST%%.*} ${PROMPT}'
;

#Title
precmd() {
  if [[ -t 1 ]]; then
      case $TERM in
        *xterm*|rxvt|(dt|k|E)term)
        print -Pn "\e]2;[%~]\a"
      ;;
        # screen)
        #    #print -Pn "\e]0;[%n@%m %~] [%l]\a"
        #    print -Pn "\e]0;[%n@%m %~]\a"
        #    ;;
      esac
  fi
  vcs_info
}


# ------------------------------
# Other Settings
# ------------------------------

### Aliases ###
#時刻を表示させる
alias history='history -E'
alias vi='vim'

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

# [git alias] aliases
alias gco='git co'
alias gbr='git br'
alias gst='git st'
alias gcm='git cm'
alias gps='git ps'
alias gpl='git pl'
alias gdf='git df'
alias gad='git ad'

# [tmux]
alias ta='tmux attach'

# [after alias]cdコマンド実行後、llを実行する
function cd() {
  builtin cd $@ && ll;
}

# ローカル設定があればロード
if [ -f ~/.local.zsh ]; then
	. ~/.local.zsh
fi
