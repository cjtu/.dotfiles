# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# bring in cluster bashrc
if [ -f /common/conf/bashrc ]; then
        . /common/conf/bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# update the window size after each command
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [[ $TERM =~ "256color" ]]; then
    # Host colors between 16 and 256, but only grayscale after 201
    host_color="38;5;$((16 + 72 + $(hostname | cksum | cut -c1-3) % 216-72))";
    #host_color="38;5;$((16 + $(hostname | cksum | cut -c1-3) % 216))";
    #host_color="38;5;$((16 + 12 * ($(hostname | cksum | cut -c1-3) % 12)))";

else
    host_color="1;$((31 + $(hostname | cksum | cut -c1-3) % 6))";
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[${host_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt 


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Fix dumb Ctrl-S behaviour
stty -ixon

# environment variables
export INPUTRC="~/.inputrc"
alias davinci="davinci -l ~/.dvlog"
export HISTIGNORE="&:ls:[bf]g:d[fu]:exit"
export CDPATH='.:~'

# variables
export SSH_ID="ctaiudovicic"
export TIU="10.11.11.11"
export MONSOON="monsoon.hpc.nau.edu"
export WIND="wind.hpc.nau.edu"
export RAIN="rain.hpc.nau.edu"
export DTN="dtn1.hpc.nau.edu"
export DIVINER="luna1.diviner.ucla.edu"

# aliases
alias chrome='~/bin/opt/google/chrome/google-chrome'
alias cdp='cd ~/projects'
alias cdc='cd /mnt/c/Users/cjtai/'
alias cda='cd /common/contrib/classroom/ast520/tess_batman'
alias cdd='cd /nfs/data/'
alias g=git
#alias vpn='sudo openvpn --config /etc/openvpn/nau_mars_vpn.ovpn'
alias serve='bundle exec jekyll serve'
alias env1='source activate env1'
alias env2='source activate thermal_corr'
alias envq='source deactivate'

alias nb='jupyter notebook'
alias nbserver='env1; jupyter notebook --no-browser --port=8080'

alias ssh='ssh -XY'
alias sshtiu='ssh ${SSH_ID}@${TIU}'
alias sshmonsoon='ssh cjt347@${MONSOON}'
alias sshwind='ssh cjt347@${WIND}'
alias sshrain='ssh cjt347@${RAIN}'
alias sshdtn='ssh cjt347@${DTN}'
alias sshdiviner='ssh Cjtu@${DIVINER}'
alias jupytertiu='ssh -N -L 8080:localhost:8080 ${SSH_ID}@${TIU}'
alias jupytermonsoon='ssh -N -L 8080:localhost:8080 cjt347@${MONSOON}'

# Compiler options
alias gcc='gcc -O3'
alias gccpt='gcc -pthread'
alias gccwarn='gccpt -std=c99 -pedantic -Wall -Wextra'
alias gccanal='gccwarn -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wjump-misses-init -Wdouble-promotion -Wshadow -Wformat=2'

# Path
export PATH="/nfs/software/davinci_install/share/davinci/library/bin:$PATH"
export PATH="$PATH:~/.scripts"
export PATH="$PATH:$HOME/bin"
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Monsoon aliases
alias js="jobstats -u cjt347"
alias sq="squeue -u cjt347"
alias rcl="module load rclone; rclone sync -L . gdrive:/homedrive"

# Start in WSL and fix XTERM
if [[ $HOSTNAME = 'luna' ]]; then
    alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
    alias code="/mnt/c/Users/cjtai/AppData/Local/Programs/Microsoft\ VS\ Code/Code.exe"
    alias ffs="/mnt/c/Program\ Files/FreeFileSync/FreeFileSync.exe"
    export DISPLAY=localhost:0.0
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' 
fi

# added by Anaconda3 installer
export PATH="/home/ctaiudovicic/anaconda3/bin:$PATH"

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/cjtu/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/cjtu/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cjtu/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/cjtu/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
