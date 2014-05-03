Installation
------------

Aside from executing ``setup.sh`` there are a few things that you need to setup
as well to get all features of this setup working. But to get you started you
will need to run the following commands::

    $ git clone https://github.com/amrali/environ.git ~/environ
    $ cd ~/environ/
    $ ./setup.sh

To get an idea of the vim plugins installed you need to run the following::

    $ git submodule status

Go
--

If you are using an Ubuntu derivative it is a good idea to add the following PPA::

    $ sudo apt-add-repository ppa:duh/golang

Refresh your local packages cache by running ``apt-get update``. Install Go package
from the repository by running ``apt-get install golang``.

After having Go installed you will need to configure a few things before having a
fully functional Go development environment. Issue the following commands in order::

    $ mkdir -p ~/bits/go/
    $ go get -u github.com/nsf/gocode
    $ go get -u github.com/jstemmer/gotags

That's it, now you have a ready Go development environment.

CoffeeTags
----------

To enable CoffeeScript_ tags generation and add tagbar support you have to install
CoffeeTags_ by running ``gem install CoffeeTags``. You do **not** have to generate
a TagBar configuration as that is already done in ``.vim/ftplugin/coffee.vim``.

asciinema
---------

The best terminal tool to have in your arsenal. Record terminal sessions and
share them with everyone. Think YouTube of the terminal::

    sudo apt-add-repository ppa:zanchey/asciinema
    sudo apt-get update
    sudo apt-get install asciinema

.. _CoffeeTags: https://github.com/lukaszkorecki/CoffeeTags
.. _CoffeeScript: http://coffeescript.org
.. _asciiio: http://ascii.io

