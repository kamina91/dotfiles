# dotfiles

dotfiles (CentOS 6.5)

## How To Use

1. git clone
1. chmod +x init_dotfile.sh
1. sh init_dotfile.sh
1. Enjoy! XD

## 注記とか

- init_dotfiles.shはいろいろな人のものを参考に、自分用に編集したものです。
- そもそもvimrc自体いろいろなところから~~パク~~参考にさせていただいています。

## 動作環境

- Unix系
- DOS系ではまず動かないと考えられます

## vim install

1. install ruby, python, lua
1. git clone https://github.com/vim/vim.git
1. `./configure --enable-multibyte --enable-xim --enable-fontset --enable-luainterp --with-features=huge --disable-selinux --enable-luainterp=yes --enable-rubyinterp=yes --enable-pythoninterp=yes`
1. make && make install
