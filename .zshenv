# This file is read first and is read by all instances of zsh (login shells and other)

# XDG directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

export EDITOR=vim

. "$HOME/.cargo/env"
