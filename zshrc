# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*~*.zwc(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/(pre|post)/*|*.zwc)
          :
          ;;
        *)
          . $config
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*~*.zwc(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="lambda"
ALIAS_TIPS_DIR="${HOME}/.oh-my-zsh/custom/plugins/alias-tips"
if [ ! -d ${ALIAS_TIPS_DIR} ]; then
    mkdir -p $(dirname ${ALIAS_TIPS_DIR})
    git clone https://github.com/djui/alias-tips.git ${ALIAS_TIPS_DIR}
fi
plugins=(
    alias-tips
    asdf
    autojump
    bundler
    common-aliases
    docker
    docker-compose
    git
    git-flow
    macos
    rails
)
source $ZSH/oh-my-zsh.sh

# shellcheck source=/dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden' # maybe add later: --no-ignore --glob "!.git/*"'
alias fp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"

export LESS=-iXFR # makes git log and other git commands easier to view

export HOMEBREW_NO_ENV_HINTS=true

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
