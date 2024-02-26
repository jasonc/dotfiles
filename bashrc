# .bashrc

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# User specific aliases and functions

# Set line editing to vi-style.
set -o vi

# Increase the default shell history retention.
HISTFILESIZE=50000
export HISTFILESIZE

# Do not store duplicates in history or commands that start with a space.
HISTCONTROL=ignoreboth:erasedups
export HISTCONTROL

# Set the prompt.
PS1="[\u@\h \w]\$ "
export PS1

# Set the PATH.
PATH=/usr/xpg4/bin:$PATH:/sbin:/usr/sbin:/opt/csw/bin:/usr/openwin/bin:/opt/tivoli/tsm/client/ba/bin:/usr/openv/netbackup/bin:/opt/emc/SYMCLI/bin:~/bin:~/scripts
export PATH

# Aliases
alias ll='ls -l'                        # Long listing format for ls.
alias lsd='ls -ld'                      # Long listing format, non-recursive for directories.
alias vi='vim'                          # Improved vi.
alias dr='screen -dr || screen'         # Quickly resume a screen session or start one.
alias grpe='grep'                       # Fix a common typo.
alias utc='TZ=UTC date'                 # Time in UTC.
alias vdf='vagrant destroy -f'          # Vagrant shortcuts
alias vgs='vagrant global-status'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vuvs='vagrant up ; vagrant ssh'

# Some things only work on Linux.
if [ $OSTYPE == "linux-gnu" ]
then
  alias ct='column -t'                   # Pretty print help.
  alias d='date +%F'                     # Useful for backing up files.  Example: cp hosts hosts.`d`
  alias dfc='df -hPT | column -t'        # Easy to read df output.
  alias ls='ls --color=auto'             # Colorize
  alias grep='grep --color=auto'         # Colorize
  alias egrep='egrep --color=auto'       # Colorize
  alias tree='tree -C'                   # Colorize
else
  alias d='date +%Y-%m-%d'               # Useful for backing up files.  Example: cp hosts hosts.`d`
  alias md5sum='shasum'                  # Mac doesn't ship with md5sum.
  alias macvim='/Applications/MacVim.app/Contents//MacOS/MacVim'
fi

# Ubuntu specific alias for docker.
[ $(grep -i ubuntu /etc/os-release 2>/dev/null | wc -l) -gt 0 ] && alias docker='docker.io'

# rbenv
[ -e ~/.rbenvrc ] && . ~/.rbenvrc

# Python
[ -e ~/.pythonstartup.py ] && export PYTHONSTARTUP=~/.pythonstartup.py

# Vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt 

# Increase nofile (max number of open files)
ulimit -n 4096 2>/dev/null

# Srsly ansible.
export ANSIBLE_NOCOWS=1

# Custom settings on a per-server basis.
[ -e ~/.bashrc_local ] && . ~/.bashrc_local

# Some things are only for Macs.
if [[ $OSTYPE == darwin* ]]
then
  # Aliases
  alias ll='ls -lG'                        # Long listing format for ls.
  alias lsd='ls -ldG'                      # Long listing format, non-recursive for directories.

  # Bash Completion
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  # For inetutils via Brew for things like ftp.
  PATH="/usr/local/opt/inetutils/libexec/gnubin:$PATH"
fi
