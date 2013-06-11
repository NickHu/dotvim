==========
Vim config
==========

----------
Install
----------

.. code:: bash

  git clone https://github.com/NickHu/dotvim.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  git submodule update --init
  vim -u ~/.vim/bundles.vim
  :BundleInstall

-------------
YouCompleteMe
-------------

.. code:: bash

  cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/cpp
  make ycm_core

----------
Powerline
----------

.. code:: bash

  mkdir -p ~/.fonts
  ln -s ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.fonts/
  fc-cache -vf ~/.fonts
  mkdir -p ~/.config/fontconfig/conf.d
  ln -s ~/.vim/bundle/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
