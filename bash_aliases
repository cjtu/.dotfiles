# Bash aliases
alias davinci="davinci -l ~/.dvlog"

# Use GitHub's git wrapper if it exists (https://github.com/github/hub)
if hash hub 2>/dev/null; then
    alias g=hub
else
    alias g=git
fi

# cdc to Windows C:\ home if on WSL
cdc() {
if [[ $(grep -i Microsoft /proc/version) ]]; then
    cd $(wslpath $(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r'))
fi    
}
alias cdp='cd ~/projects'
alias serve='bundle exec jekyll serve'
alias ssh='ssh -XY'

# Compiler options
alias gcc='gcc -O3'
alias gccpt='gcc -pthread'
alias gccwarn='gccpt -std=c99 -pedantic -Wall -Wextra'
alias gccanal='gccwarn -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wrestrict -Wnull-dereference -Wjump-misses-init -Wdouble-promotion -Wshadow -Wformat=2'

# SLURM aliases
alias js="jobstats -u $USER"
alias sq="squeue -u $USER"
alias rcl="module load rclone; rclone sync -L . gdrive:/homedrive"

# gcloud
alias dev_vm='christian-taiudo-dev'
alias isofit_vm='christian-taiudo-isofit'
alias tanager_vm='tanager-flc-isofit-rnd-vm-fixed'
alias gcloud_start='gcloud compute instances start --project planet-datapipeline-staging'
alias gcloud_stop='gcloud compute instances stop --project planet-datapipeline-staging'

# Set up prompt color and show Git branch in prompt PS1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [[ $TERM =~ "256color" ]]; then
    # Host colors between 16 and 256, but only grayscale after 201
    host_color="38;5;$((16 + 72 + $(hostname | cksum | cut -c1-3) % 216-72))";
else
    host_color="1;$((31 + $(hostname | cksum | cut -c1-3) % 6))";
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[${host_color}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[91m\]$(parse_git_branch)\[\e[00m\]$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt 