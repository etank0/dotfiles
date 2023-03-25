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

# for pywal
#cat ~/.cache/wal/sequences

#for nodejs
export PATH=/usr/local/lib/nodejs/node-v18.12.1-linux-x64/bin:$PATH
export PATH="/home/swetank/.local/bin:$PATH"

#for cs50
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"

 eval "$(starship init bash)"
