This is a [Tic Tac Toe][tictactoe] implementation in [Io][io] as part of my residency at [8th Light][8thlight].

Installation
============

    # install the Io programming language
    $ brew install io
    
    # install test lib
    $ git clone https://github.com/benmills/willful.git
    $ cd willful
    $ io install.io
    $ cd ..
    $ rm -rf "willful"
    
    # install ttt-io
    $ git clone git://github.com/JoshCheek/ttt-io.git
    $ cd ttt-io

Run Tests
=========

    $ willful test/*-test.io test/cli/*-test.io

Play Game
=========

    $ bin/ttt-io
    

[tictactoe]:  http://en.wikipedia.org/wiki/Tic_tac_toe
[io]:         http://iolanguage.com/
[8thlight]:   http://www.8thlight.com/
