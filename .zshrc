export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/dev/sol/target/debug:$PATH"

alias vi=nvim

# PROMPT='%F{214}%B%n%b%F%F{white}%F%F{214}%B%m%b%F %F{white}in%F %F{blue}%B%~%b%F %F{white}%F%F{214}%Bﬦ%b%F ' #::

source /usr/share/zsh/share/antigen.zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# Config options: https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
export SPACESHIP_PROMPT_ADD_NEWLINE="false"
export SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
export SPACESHIP_PROMPT_DEFAULT_SUFFIX=" "
export SPACESHIP_CHAR_SYMBOL="λ "
export SPACESHIP_CHAR_COLOR_SUCCESS="214"
export SPACESHIP_CHAR_COLOR_FAILURE="214"

# PROMPT
export SPACESHIP_USER_SHOW="always"
export SPACESHIP_USER_COLOR="214"
export SPACESHIP_USER_SUFFIX=""

export SPACESHIP_HOST_SHOW="always"
export SPACESHIP_HOST_COLOR="214"
export SPACESHIP_HOST_PREFIX=""

export SPACESHIP_DIR_SHOW="true"
export SPACESHIP_DIR_PREFIX="in "
export SPACESHIP_DIR_TRUNC="3"
export SPACESHIP_DIR_TRUNC_PREFIX="…/"
export SPACESHIP_DIR_TRUNC_REPO="false"
export SPACESHIP_DIR_COLOR="blue"

export SPACESHIP_GIT_SHOW="true"
export SPACESHIP_GIT_PREFIX=""

# RPROMPT
export SPACESHIP_EXIT_CODE_SHOW="true"
export SPACESHIP_EXEC_TIME_PREFIX="愈"
export SPACESHIP_TIME_SHOW="true"
export SPACESHIP_TIME_PREFIX=" "
export SPACESHIP_TIME_SUFFIX=""

export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  aws           # Amazon Web Services section
  battery       # Battery level and status
  line_sep      # Line break
  char          # Prompt character
)

spaceship_rprompt_prefix() {
  echo -n '%{'$'\e[1A''%}'
}

spaceship_rprompt_suffix() {
  echo -n '%{'$'\e[1B''%}'
}

export SPACESHIP_RPROMPT_ORDER=(
  rprompt_prefix
  exit_code     # Exit code section
  exec_time     # Execution time
  time          # Time stamps section
  rprompt_suffix
)

antigen theme denysdovhan/spaceship-prompt

antigen apply
