export ZDOTDIR=$HOME/.config/zsh

# XDG directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export HISTFILE=$XDG_STATE_HOME/zsh/history

export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc

export GNUPGHOME=$HOME/.gnupg

export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

# Needed for valgrind on arch
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

export EDITOR=vim
