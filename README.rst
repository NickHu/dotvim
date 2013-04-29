==========
Vim config
==========

----------
Install
----------

.. code:: bash

  ln -s ~/.vim/vimrc ~/.vimrc
  ln -s ~/.vim/gvimrc ~/.gvimrc
  git submodule update --init
  vim -u ~/.vim/bundles.vim
  :BundleInstall

----------
Powerline
----------

.. code:: bash

  ln -s ~/.vim/bundle/powerline/font/PowerlineSymbols.otf ~/.fonts/
  fc-cache -vf ~/.fonts
  ln -s ~/.vim/bundle/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
