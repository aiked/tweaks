# bash_profile for mac
# jit

# Promt
# export PS1="\e[1;35m\u \e[1;33m\W \e[1;36m>\e[00m"
# export PS1="\[\033[1;35m\]\u \[\033[1;33m\]\W \[\033[1;36m\]> \[\033[00m\]"

export PS1="\e[1;33m\W \e[1;36m>\e[00m"
export PS1="\[\033[1;33m\]\W \[\033[1;36m\]> \[\033[00m\]"

# Title bar
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# Colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Paths
export PATH=/usr/texbin:/Users/jit/bin:$PATH

export jit=$HOME/Dropbox/forth/jitrop/

# Editor
export EDITOR=/usr/bin/vim

# Blocksize for ls, df, du
export BLOCKSIZE=1k

# Alias
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias disks='df -ha'
alias ..='cd ..'                           # Go back 1 directory level
alias lsusb="system_profiler SPUSBDataType"
alias mykonos='echo "mykonoooooooooooooooooooooooooooooooos"'

# program alias
alias vim="mvim -v"
# extract 
extract(){
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1	;;
			*.tar.gz)	tar xzf $1	;;
			*.bz2)		bunzip2 $1 	;;
			*.rar)		unrar e $1	;;
			*.gz)		gunzip  $1	;;
			*.tar)		tar xf $1	;;
			*.tbz2)		tar xjf $1	;;
			*.tgz)		tar xzf $1	;;
			*.zip)		unzip $1	;;
			*)	echo "'$1' invalid format" ;;
		esac
	else
		echo "'$1' invalid file"
	fi
}

