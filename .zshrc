# Enabling and setting git info var to be used in prompt config.
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ":vcs_info:git*" formats '[%b]'
precmd() {
    vcs_info
}

COLOR_USR="%F{white}"
COLOR_DIR="%F{yellow}"
COLOR_GIT="%F{cyan}"
COLOR_PCHAR="%F{208}"
setopt PROMPT_SUBST # Evaluate function calls in prompt
PROMPT='${COLOR_USR}%n@%m %F{white}in ${COLOR_DIR}%~ ${COLOR_GIT}${vcs_info_msg_0_}
${COLOR_PCHAR}η '
RPROMPT=""

HISTFILE=$HOME/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim=nvim
alias c++="g++ -std=c++20 -Wall -Wextra -pedantic"

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
