if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /usr/share/zsh/share/antigen.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
fi

# Load Antigen configurations
antigen init ~/.antigenrc

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

export EDITOR="nvim"

alias ssh="kitty +kitten ssh"
alias ls="lsd"
alias cat="bat"

alias w++17="g++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++ -Wold-style-cast"
alias cm="cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && make -C build && cp build/compile_commands.json ."

alias lcl="python3 ~/.config/scripts/clean_latex.py"

alias toswe="trans :swe"
alias toen="trans :en"
alias tode="trans :de"


bindkey '^j' _zsh_autosuggest_widget_accept
