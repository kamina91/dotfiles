#!/bin/sh

# current dir
cd $(dirname $0)

# update vim plugins
git submodule init
git submodule foreach 'git pull origin master'

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
