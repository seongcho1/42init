#!/bin/bash


# link cache directories to goinfre

TARGET=(
  "Caches"
  "ApplicationSupport/Code/Cache"
  "ApplicationSupport/Code/CachedData"
  "ApplicationSupport/Code/CachedExtensions"
  "ApplicationSupport/Code/CachedExtensionVSIXs"
  "ApplicationSupport/Code/Code Cache"
  "ApplicationSupport/VSCodium/Cache"
  "ApplicationSupport/VSCodium/CachedData"
  "ApplicationSupport/VSCodium/CachedExtensions"
  "ApplicationSupport/VSCodium/CachedExtensionVSIXs"
  "ApplicationSupport/VSCodium/Code Cache"
  "ApplicationSupport/Slack/Cache"
  "ApplicationSupport/Slack/CachedData"
  "ApplicationSupport/Slack/Service Worker/CacheStorage"
  "ApplicationSupport/Slack/Service Worker/ScriptCache"
)

for ((i = 0; i < ${#TARGET[@]}; i++)); do
  mkdir -p "$HOME/goinfre/${TARGET[$i]}"
  rm -rf "$HOME/Library/${TARGET[$i]}"
  ln -s "$HOME/goinfre/${TARGET[$i]}" "$HOME/Library/${TARGET[$i]}"
done


# basic setup

set -e

(cd ~/goinfre && rm -f vscode.zip && curl -o vscode.zip -L https://az764295.vo.msecnd.net/stable/97dec172d3256f8ca4bfb2143f3f76b503ca0534/VSCode-darwin-universal.zip && rm -rf "Visual Studio Code.app" && unzip vscode.zip) | cat
# (cd ~/goinfre && rm -f vscodium.zip && curl -o vscodium.zip -L https://github.com/VSCodium/vscodium/releases/download/1.74.3.23010/VSCodium-darwin-x64-1.74.3.23010.zip && rm -rf VSCodium.app && unzip vscodium.zip) | cat

(cd  ~/goinfre && rm -f sublime.zip && curl -o sublime.zip -L https://download.sublimetext.com/sublime_text_build_4143_mac.zip && rm -rf "Sublime Text.app" && unzip sublime.zip) | cat

curl -fsSL https://raw.githubusercontent.com/hakamdev/42homebrew/master/install.sh | zsh
