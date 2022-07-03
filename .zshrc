export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias vi=nvim

source /usr/share/gitstatus/gitstatus.prompt.zsh
setopt PROMPT_SUBST
git_status() {
  [[ $VCS_STATUS_RESULT == 'ok-sync' ]] || return 0  # not a git repo
  echo '%F{blue}%F '$GITSTATUS_PROMPT''
}

PROMPT='%F{214}%B%n%b%F %F{white}in%F %F{blue}%B%~%b%F %F{white}%F%F{214}%Bﬦ%b%F ' #
RPROMPT='$(git_status)'

source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# Tell Antigen that you're done.
antigen apply
