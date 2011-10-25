# lib
doRelativeFile("../lib/tic-tac-toe.io")

# test lib
doFile(System ioPath .. "/willful.io")

# mocks
doRelativeFile("mock-board.io")
doRelativeFile("mock-player.io")
doRelativeFile("mock-board-analyzer.io")
doRelativeFile("cli/mock-input.io")
doRelativeFile("cli/mock-output.io")

# define helper methods on this object
TestHelper := Object clone
