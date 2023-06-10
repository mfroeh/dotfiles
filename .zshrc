# Setup zim
ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing
[[ ! -e ${ZIM_HOME}/zimfw.zsh ]] && curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated
[[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]] && source ${ZIM_HOME}/zimfw.zsh init -q

PROMPT="%F{white}%n@%m%f in %F{cyan}%~%f
%F{blue}η%f "
RPROMPT=""

# Initialize modules
source ${ZIM_HOME}/init.zsh
