#!/bin/sh

# current dir
cd $(dirname $0)

# download neobundle files
git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

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
ln -Fis ~/dotfiles/vimfiles ~/.vim

# update vim plugins
git submodule init
git submodule foreach 'git pull origin master'

