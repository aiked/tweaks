# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        if [[ ${EUID} == 0 ]] ; then
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
        else
                PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
        fi

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi

# Try to keep environment pollution down, EPA loves us.
unset use_color safe_term match_lhs

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi

color_prompt=yes
# PS1 Way to print terminal promt
#export PS1="\e[1;35m\u \e[1;33m\W \e[1;36m>\e[00m "
# export PS1="\[\033[1;35m\]\u \[\033[1;33m\]\W \[\033[1;36m\]> \[\033[00m\]"
export PS1="\e[1;33m\W \e[1;36m>\e[00m "

export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
export TERM="screen-256color"

# Paths
export PATH="$PATH:/home/michath/bin"
export PATH="$PATH:/home/michath/Dropbox/bin"
# android sdk
export PATH="$PATH:/opt/android-sdk-linux/tools/"
export PATH="$PATH:/opt/android-sdk-linux/platform-tools/"
# Other paths
export jit="$HOME/Dropbox/forth/jitrop/"

# GNU Radio installation
export PATH=$PATH:/opt/gnuradio/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

# Alias
alias cp="cp -v"
alias mv="mv -v"
alias mkdir="mkdir -pv"
alias disks="df -ha"
alias network="sudo iptraf"
alias ..="cd .."
alias ll="ls -FGlAhp"
alias la="ls -a"

# Byobu
alias byobu_create="buobu new -s jit"
alias byobu_connect="byobu attach -t jit"
alias byobu_rename="byobu rename-session -t 1 jit"

# MDM
alias mdm_start="sudo service mdm start"
alias mdm_stop="sudo service mdm stop"

# SVN
alias svn_add_all="svn status | grep ^\? | awk '{print $2}' | xargs svn add"
alias svn_rm_all="svn status | grep '^\!' | sed 's/! *//' | xargs -I% svn rm %"

archive(){
	echo "tar -zcvf result.tar.gz folder"
}

#locale
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

/usr/bin/mint-fortune
