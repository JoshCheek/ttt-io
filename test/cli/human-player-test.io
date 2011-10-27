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
)

