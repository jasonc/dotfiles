# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

# Set line editing to vi-style.
set -o vi

# Increase the default shell history retention.
HISTFILESIZE=50000
export HISTFILESIZE

# Set the prompt.
PS1="[\u@\h \w]\$ "
export PS1

# Set the PATH.
PATH=$PATH:/sbin:/usr/sbin:/usr/xpg4/bin:/opt/csw/bin:/usr/openwin/bin:/opt/tivoli/tsm/client/ba/bin:/usr/openv/netbackup/bin:/opt/emc/SYMCLI/bin:~/bin:~/scripts
export PATH

# Aliases
alias ll='ls -l'			# Long listed format for ls.
alias vi='vim'				# Improved vi.
alias dr='screen -dr || screen'		# Quickly resume a screen session or start one.
alias grpe='grep'			# Fix a common typo.
alias utc='TZ=UTC date'			# Time in UTC.

# Some things only work on Linux.
if [ $OSTYPE == "linux-gnu" ]
then
  alias ct='column -t'			# Pretty print help.
  alias d='date +%F'			# Useful for backing up files.  Example: cp hosts hosts.`d`
  alias dfc='df -hPT | column -t'	# Easy to read df output.
  alias ls='ls --color=auto'		# Colorize
  alias grep='grep --color=auto'	# Colorize
  alias egrep='egrep --color=auto'	# Colorize
else
  alias d='date +%Y-%m-%d'		# Useful for backing up files.  Example: cp hosts hosts.`d`
fi

# rbenv
if [ -e ~/.rbenvrc ]
then
  . ~/.rbenvrc
fi

# Increase nofile (max number of open files)
ulimit -n 4096 2>/dev/null
