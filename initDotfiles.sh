#!/bin/sh
cd $(dirname $0)
git submodule init
git submodule foreach 'git pull origin master'

for dotfile in .?*; do
    case $dotfile in 
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        *)
            ln -Fis "$PWD/$dotfile" $HOME;;
    esac
done
