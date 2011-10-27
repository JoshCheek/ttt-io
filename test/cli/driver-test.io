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
  
  it("prompts the user whether they want to go first or second",
    output  := MockOutput clone
    input   := MockInput withLines(list(1, 1, 2, 4))
    driver  := Cli Driver clone withInput(input) withOutput(output)
    driver drive
    output promptedToGoFirstOrSecond will == true
    input  timesGotFirstOrSecond will == 1
    driver player1 type will == "HumanPlayer"
    driver player2 type will == "ComputerPlayer"
  )
  
  it("prompts alternating players for every move until the game is over, then notifies results",
    output  := MockOutput clone
    player1 := MockPlayer withMoves(list(1, 4, 7))
    player2 := MockPlayer withMoves(list(2, 5))
    driver := Cli Driver clone withPlayers(player1, player2) withOutput(output)
    driver currentPlayer will == player1
    driver takeTurn
    driver currentPlayer will == player2
    driver takeTurn
    driver currentPlayer will == player1
    driver drive
    board := driver game board
    output numberOfTimesWasAskedToShowResults will == 1
    output wasAskedToShowResultsWith(board asString, 1)
  )  
)
