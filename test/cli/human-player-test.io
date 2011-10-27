doRelativeFile("../test-helper.io")

describe("HumanPlayer test",
  
  it("gets the human player's move",
    game   := TicTacToe clone
    input  := MockInput withLines(list(5))
    output := MockOutput clone
    player := Cli HumanPlayer clone
    player getMove(game, input, output) will == 5
    output numberOfTimesWasAskedForMove will == 1
  )
  
  it("reprompts until move is valid",
    board  := MockBoard clone setAvailablePositions(list(8))
    game   := TicTacToe clone withBoard(board)
    input  := MockInput withLines(list(9,8,7))
    output := MockOutput clone
    player := Cli HumanPlayer clone
    player getMove(game, input, output) will == 8
    output numberOfTimesWasAskedForMove will == 2
    output numberOfTimesAlertedInvalid will == 1
  )
)

