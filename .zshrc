for file in $ZDOTDIR/zshrc.d/*.{sh,zsh}(N); do
  case $file:t in ~*) continue;; esac
  source "$file"
done