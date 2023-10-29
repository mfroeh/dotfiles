# Bootstrap sheldon
if [[ ! -f "$HOME/.local/bin/sheldon" ]]; then 
	curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

PROMPT="%F{white}%n@%m%f in %F{cyan}%~%f
%F{blue}η%f "
RPROMPT=""

alias vim=nvim

# Required for cuda on WSL
export LD_LIBRARY_PATH=/usr/lib/wsl/lib:$LD_LIBRARY_PATH

eval "$(sheldon source)"
