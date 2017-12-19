# aike 

export TERM="xterm-256color"
# base16-shell (https://github.com/chriskempson/base16-shell)
BASE16_SHELL=$HOME/dev/git/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# oh-my-zsh
export ZSH=$HOME/dev/git/oh-my-zsh
source $ZSH/oh-my-zsh.sh

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

function zle-line-init zle-keymap-select {
 VIM_NP="%{$fg[blue]%}%c%{$reset_color%}"
 VIM_IP="%{$fg[green]%}%c%{$reset_color%}"
 PROMPT="%f${${KEYMAP/vicmd/$VIM_NP}/(main|viins)/$VIM_IP} "
 zle reset-prompt
}

DISABLE_AUTO_TITLE="true"
title() {
  window_title="\e]0;$1\a"
  echo -ne "$window_title"
}


export KEYTIMEOUT=1
alias vim='mvim -v' 
export EDITOR='mvim -v'

zle -N zle-line-init
zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^s' beginning-of-line
bindkey '^e' end-of-line

# Tmux
alias tmuxa="title carina; tmux attach -t mikath"
alias tmuxn="title carina; tmux new -s mikath"



# Common alias
alias ls='ls -GF'
alias la='ls -a'
alias ll="ls -FGlAhp"
alias disks="df -H"
alias cp="cp -v"
alias mv="mv -v"
alias rmf="rm -rf"
alias mkdir="mkdir -pv"
alias disks="df -ha"
alias network="sudo iptraf"
alias ..="cd .."
alias untar="tar -xzvf"
alias c="clear"

export PATH=~/Applications:$PATH

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
bindkey '^R' history-incremental-search-backward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^N" forward-word
bindkey "^P" backward-word

autoload -Uz compinit
compinit

platform=`uname`
# osx specific stuff
if [[ "$platform" == "Darwin" ]]; then
  # file descriptors 
  ulimit -n 5120
fi 

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# history
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# android
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools

# function run
run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

showcolors256 () {
    for code in {0..255}
    do
        echo -e "\e[38;05;${code}m $code: Test"
    done
}

# enable command highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
