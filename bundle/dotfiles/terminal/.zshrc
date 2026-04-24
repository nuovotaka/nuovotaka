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
if [[ $(command -v eza) ]]; then
     alias ee='eza --icons'
     alias ea='eza -aal --header --git --icons'
     alias eta='eza -T -L 3 -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
 fi
export LANG=ja_JP.UTF-8

alias ll='eza -l --icons --git'
alias la='eza -la --icons --git'
alias cat='bat'

eval "$(starship init zsh)"

. /nix/var/nix/profiles/default/etc/profile.d/nix.sh

export PATH="/Users/taka_mbp/.volta/bin:$PATH"

# Added by Antigravity
export PATH="/Users/taka_mbp/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/taka_mbp/.antigravity/antigravity/bin:$PATH"
