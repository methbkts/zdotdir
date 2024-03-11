# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state
export XDG_RUNTIME_DIR=~/.xdg
export XDG_PROJECTS_DIR=~/Projects

# Add variables for key Zsh directories.
export __zsh_config_dir=${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}
export __zsh_user_data_dir=${XDG_DATA_HOME:-$HOME/.local/share}/zsh
export __zsh_cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/zsh

# Ensure Zsh directories exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} __zsh_{config,user_data,cache}_dir XDG_{CONFIG,CACHE,DATA,STATE}_HOME XDG_{RUNTIME,PROJECTS}_DIR

# Custom
export DOTFILES=$XDG_CONFIG_HOME/dotfiles
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export REPO_HOME=$XDG_CACHE_HOME/repos
export ANTIDOTE_HOME=$REPO_HOME

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path cdpath

# Set the list of directories that cd searches.
cdpath=(
  $XDG_PROJECTS_DIR(N/)
  $XDG_PROJECTS_DIR/mattmc3(N/)
  $cdpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  # core
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)

  # emacs
  $HOME/.emacs.d/bin(N)
  $XDG_CONFIG_HOME/emacs/bin(N)

  # apps
  /{usr/local,opt/homebrew}/opt/curl/bin(N)
  /{usr/local,opt/homebrew}/opt/go/libexec/bin(N)
  /{usr/local,opt/homebrew}/share/npm/bin(N)
  /{usr/local,opt/homebrew}/opt/ruby/bin(N)
  /{usr/local,opt/homebrew}/lib/ruby/gems/*/bin(N)
  $HOME/.gem/ruby/*/bin(N)

  # path
  $path
)

# Apps
export EDITOR=hx
export VISUAL=code
export PAGER=less
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Regional settings
export LANG='en_US.UTF-8'

# Misc
export KEYTIMEOUT=1
export SHELL_SESSIONS_DISABLE=1 # Make Apple Terminal behave.

# Use `< file` to quickly view the contents of any file.
[[ -z "$READNULLCMD" ]] || READNULLCMD=$PAGER

# vim: ft=zsh sw=2 ts=2 et
