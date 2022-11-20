if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /usr/share/zsh/share/antigen.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
fi

# Load Antigen configurations
antigen init ~/.antigenrc

export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Needed for valgrind on arch
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

export EDITOR="vim"

alias ssh="kitty +kitten ssh"
alias ls="lsd"
alias cat="bat"
alias t="tree -L 3"
alias td="tree -d -L 3"

alias w++20="g++-11 -std=c++20 -pedantic -Wall -Wextra"

alias ccmake="cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && mv build/compile_commands.json . && make -C build"

alias toswe="trans :swe"
alias toen="trans :en"
alias tode="trans :de"

eval "$(zoxide init --cmd j zsh)"
