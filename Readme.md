This is a [Tic Tac Toe][tictactoe] implementation in [Io][io] as part of my residency at [8th Light][8thlight].

Best move is calculated with an array of possible moves that is searched. This is inefficient, but using
hashmaps was causing segfaults when they got sufficiently large.

The initial version calculated the result, but it was far too slow to use (on the order of minutes)
despite some optimizations I made.

Big thanks goes to [Jeremy Treguna][jer] for all his help on IRC.

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
[jer]:        https://gist.github.com/jeremytregunna
