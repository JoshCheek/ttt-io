doRelativeFile("../test-helper.io")

describe("Cli Driver",
  it("is initialized with an empty board",
    driver := Cli Driver clone
    driver board isEmpty will == true
  )
  
  it("knows its board",
    board := MockBoard clone
    driver := Cli Driver clone withBoard(board)
    driver board will == board
  )
  
  it("prompts alternating players for every move until the game is over",
    output  := MockOutput clone
    player1 := MockPlayer withMoves(list(1, 4, 7))
    player2 := MockPlayer withMoves(list(2, 5))
    driver := Cli Driver clone withPlayer1(player1) withPlayer2(player2) withOutput(output)
    driver currentPlayer will == player1
    driver takeTurn
    driver currentPlayer will == player2
    driver takeTurn
    driver currentPlayer will == player1
  )
)
