# aike 

# $PATH
export PATH=$PATH:/Library/TeX/texbin:/usr/local/sbin

# You gotta be pretty
PROMPT="%F{blue}%c %F{green}$ %f"

# Exports
export TERM="xterm-256color"

# Alias bin
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# Alias for the aliens
alias ls='ls -GF'
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

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

autoload -Uz compinit
compinit

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
