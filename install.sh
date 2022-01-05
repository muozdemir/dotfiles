#!/usr/bin/env bash

# machine setup script
echo "Setting up daito's :/ machine..."

echo "Step 1/8: Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/danielharbor/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

echo "Step 2/8: Installing mac apps"
brew install --cask iterm2 --cask visual-studio-code --cask karabiner-elements --cask spotify --cask evernote --cask synergy --cask spectacle

echo "Step 3/8: Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Step 4/8: Installing terminal apps"
brew install ranger highlight bash-completion tmux tig neovim

echo "Step 5/8: Cloning zsh-autosuggestions and zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "Step 6/8: Setting up symlinks"
# first remove any existing default config files
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/Library/Application\ Support/Spectacle/Shortcuts.json
# this will likely already be cloned to get a hold of this script anyway
# git clone git@github.com:danielharbor/dotfiles.git ~/github
ln -s ~/github/dotfiles/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
ln -s ~/github/dotfiles/key_bindings/* ~/.config/karabiner/assets/complex_modifications/
ln -s ~/github/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/github/dotfiles/zshrc ~/.zshrc
ln -s ~/github/dotfiles/spectacle.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

echo "Step 7/8: Cloning vim dotfiles"
git clone git@github.com:danielharbor/vim_dotfiles.git ~/.vim

echo "Step 8/8: Cloning TPM (Tmux Plugin Manager)"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Setup complete!!! 💪"
echo "Oh, and a few manual steps... launch tmux, then install tmux plugins - Ctrl + a I, and restart the Spectacle app to pick up the updated config."
