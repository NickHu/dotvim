# Vim config

## Install

``` bash
git clone https://github.com/NickHu/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
```

Auto-install should complete on first run, then restart vim

## Powerline

``` bash
mkdir -p ~/.fonts
ln -s ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
ln -s ~/.vim/bundle/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

mkdir ~/.config
ln -s ~/.vim/bundle/powerline/powerline/config_files ~/.config/powerline
```
