ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ];then
  mkdir -p "$(dirname $ZINIT_HOME)"
fi
if [ ! -e $ZINIT_HOME ];then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zinit-zsh/z-a-rust \
#     zinit-zsh/z-a-as-monitor \
#     zinit-zsh/z-a-patch-dl \
#     zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Preztoのセットアップ
zi snippet PZT::modules/directory/init.zsh
zi snippet PZT::modules/utility/init.zsh

zi light zsh-users/zsh-autosuggestions
zi light zdharma/fast-syntax-highlighting


# Customize to your needs...
# if [[ $(command -v exa) ]]; then
#     alias ee='exa --icons'
#     alias ea='exa -aal --header --git --icons'
#     alias eta='exa -T -L 3 -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
# fi
export LANG=ja_JP.UTF-8

# alias brew='PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin:/usr/local/opt/m4/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/sqlite/bin:/usr/local/opt/openssl@1.1/bin brew' 

. /usr/local/opt/asdf/libexec/asdf.sh

alias ll='exa -l --icons --git'
alias la='exa -la --icons --git'
alias cat='bat'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

eval "$(starship init zsh)"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
