PROMPT="%F{white}%n@%m%f in %F{cyan}%~%f
%F{blue}η%f "
RPROMPT=""

HISTFILE=$HOME/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim=nvim

if command -v bat &> /dev/null; then
  alias cat=bat
fi

if command -v lsd &> /dev/null; then
  alias ls="lsd --icon=never"
fi

# Required for cuda on WSL
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH

# Bootstrap sheldon
if [[ ! -f "$HOME/.local/bin/sheldon" ]]; then 
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

eval "$(sheldon source)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

if [ "$TMUX" = "" ]; then tmux; fi
