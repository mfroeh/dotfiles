if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source /usr/share/zsh/share/antigen.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source /opt/homebrew/share/antigen/antigen.zsh
fi

# Load Antigen configurations
antigen init ~/.antigenrc

alias ssh="kitty +kitten ssh"
alias ls="lsd"
alias cat="bat"
alias t="tree"
alias td="tree -d"

alias w++20="g++-11 -std=c++20 -pedantic -Wall -Wextra"

alias ccmake="cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && mv build/compile_commands.json . && make -C build"

alias toswe="trans :swe"
alias toen="trans :en"
alias tode="trans :de"

alias cd="echo 'Use j instead!'"

eval "$(zoxide init --cmd j zsh)"
