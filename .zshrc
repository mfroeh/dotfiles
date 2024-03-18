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
PROMPT='${COLOR_USR}%n@%m ${COLOR_DIR}%~ ${COLOR_GIT}${vcs_info_msg_0_}
${COLOR_PCHAR}η '
RPROMPT=""

HISTFILE=$HOME/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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
if [[ $(uname) != "Darwin" ]] && [[ ! -f "$HOME/.local/bin/sheldon" ]]; then 
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

eval "$(sheldon source)"

if [ "$TMUX" = "" ]; then tmux; fi

# >>> conda initialize >>>
# Install using https://docs.conda.io/projects/miniconda/en/latest/index.html
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [[ $(uname) != "Darwin" ]]; then
  # sudo pacman -S fzf
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
else
  # brew install fzf
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
fi
