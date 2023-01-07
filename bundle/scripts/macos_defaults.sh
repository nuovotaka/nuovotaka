#!/bin/sh

echo 📌 Configuring macOS default settings

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# ファイアーウォール入
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1
# トラックパッド
# タップでクリック
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -bool true

killall SystemUIServer

# Dockの設定
defaults write com.apple.dock tilesize -int 20
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock launchanim -bool false

killall Dock

# Terminal profileの変更
TERM_PROFILE='MyTerminal';
TERM_PATH='./dotfiles';
CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";

echo ${TERM_PROFILE}
echo ${CURRENT_PROFILE}
if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
    # open "$TERM_PATH$TERM_PROFILE.terminal"
    defaults write com.apple.Terminal "Default Window Settings" -string "$TERM_PROFILE"
    defaults write com.apple.Terminal "Startup Window Settings" -string "$TERM_PROFILE"
fi

sudo reboot
