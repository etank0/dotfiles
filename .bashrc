# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

#colors ;)
export PS1='\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;33m\]\h\[\e[0m\]  :\[\e[0;35m\]\w\[\e[0m\]\$ '

unset rc

#for aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
#::#alias mpv='gnome-session-inhibit mpv'


eval "$(starship init bash)"
