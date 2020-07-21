# installation scripts for setting up environment

install_nano() {
    # Install Nano (www.nano-editor.org) with syntax highlighting (MacOS) - https://gist.github.com/fevangelou/be744753730e86b8783fd481f311a7c9

    # return if nano is already installed
    if [ -d ~/.nano ] && [ -d ~/.nano/syntax_improved ]; then
        echo "It looks like you already have nano installed!! :/"
	    return
    fi

    VERSION="4.1"
    NANO_SHORT="nano-$VERSION"
    NANO_SRC="$NANO_SHORT.tar.gz"
    NANO_URL="https://www.nano-editor.org/dist/v4"
    NANO_EXTRA="https://github.com/danielharbor/nanorc"

    cd ~/
    curl -Ok $NANO_URL/$NANO_SRC
    tar -zxvf $NANO_SRC

    mv $NANO_SHORT .nano && cd .nano/
    ./configure && make && sudo make install

    git clone --depth=1 $NANO_EXTRA syntax_improved
    cd ~/ && touch .nanorc

# this block is intentionally not indented because of EOF
cat > .nanorc <<EOF
set nohelp
set autoindent
set tabstospaces
#set linenumbers
#set constantshow  # always display current line number and cursor position at the bottom of the screen
include ~/.nano/syntax/*.nanorc
include ~/.nano/syntax_improved/*.nanorc
EOF

    rm -vf $NANO_SRC
    printf "\nExit terminal and reopen to start using $NANO_SHORT\nTo uninstall it and revert to old:\ncd ~/.nano && sudo make clean uninstall && rm -rf ~/.nano\n"
    # exit  # uncomment to automatically restart terminal
}

setup_my_environment() {
    echo "Setting up daito's :/ environment!"

    # echo "Step 1/5: Installing & Updating brew"
    # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # brew update

    echo "Step 2/5: Installing ranger and highlight"
    brew install ranger highlight bash-completion

    # echo "Step 3/5: Installing oh-my-zsh"
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo "Step 4/5: Cloning zsh-autosuggestions and zsh-syntax-highlighting repos:"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

    # echo "Step 5/5: Installing nano:"
    # install_nano
    
    echo "Don't forget to add zsh-autosuggestions and zsh-syntax-highlighting to plugins in ~/.zshrc, i.e. plugins=(git zsh-autosuggestions zsh-syntax-highlighting)"
}
