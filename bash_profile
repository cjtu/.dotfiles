# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Start in WSL and fix XTERM
if [[ $HOSTNAME = 'luna' ]]; then
    cd ~ ;
fi
