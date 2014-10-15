#!/bin/sh

# current dir
cd $(dirname $0)

# download neobundle files
if [ -e ~/dotfiles/vimfiles/bundle/neobundle.vim ]; then
    echo "neobundle found"
else
    echo "install neobundle"
    mkdir -p ~/dotfiles/vimfiles/bundle/
    git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

    # update vim plugins
    # git submodule init
    # git submodule foreach 'git pull origin master'
fi

# make symlink
for dotfiles in .?*; do
    case $dotfiles in 
        ..)
            continue;;
        .git)
            continue;;
        *)
            ln -Fis "$PWD/$dotfiles" $HOME;;
    esac
done

if [ -e ~/.vim ]; then
    echo ".vim found. rename .vim dir"
else
    ln -vFis ~/dotfiles/vimfiles ~/.vim;
fi
