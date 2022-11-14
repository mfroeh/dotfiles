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

# For zathura with vimtex
export DBUS_SESSION_BUS_ADDRESS="unix:path=$DBUS_LAUNCHD_SESSION_BUS_SOCKET"

export EDITOR="nvim"

alias ssh="kitty +kitten ssh"
alias ls="lsd"
alias cat="bat"

alias w++17="g++ -std=c++17 -Wall -Wextra -Wpedantic -Weffc++ -Wold-style-cast"
alias ccmake="cmake -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=ON && mv build/compile_commands.json . && make -C build"

alias toswe="trans :swe"
alias toen="trans :en"
alias tode="trans :de"
