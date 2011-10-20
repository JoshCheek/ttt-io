doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")
doFile("test/mock_board.io")

describe("TicTacToe") do(
  it("Will be used like this", block(
    # initial conditions
    ttt := TicTacToe clone
    ttt board asString will == "000000000"
    ttt isOver will == false
    ttt isTie will == false
    
    # after player 1 moves
    ttt turn will == 1
    ttt move(1)
    ttt board asString will == "100000000"
    
    # player 2
    ttt turn will == 2
    ttt move(4)
    ttt board asString will == "100200000"
    
    # player 1
    ttt turn will == 1
    ttt move(2)
    ttt board asString will == "110200000"
    
    # player 2
    ttt turn will == 2
    ttt move(5)
    ttt board asString will == "110220000"
    
    # player 1
    ttt turn will == 1
    ttt move(3)
    ttt board asString will == "111220000"
    
    ttt isOver will == true
    ttt isTie will == false
    ttt winner will == 1
  ))
  
  it("alternates turns between player 1 and 2", block(
    ttt := TicTacToe clone withBoard(MockBoard clone)
    ttt turn will == 1
    ttt move(1)
    ttt turn will == 2
    ttt move(2)
    ttt turn will == 1
  ))
  
  it("marks its moves on the board", block(
    ttt := TicTacToe clone withBoard(MockBoard clone)
    ttt board wasMarked(9, 1) will == false
    ttt move(9)
    ttt board wasMarked(9, 1) will == true
  ))
  
  it("knows it's over when there is a winner", block(
    findsWinner := MockBoardAnalyzer clone withWinner(1)
    ticTacToe   := TicTacToe clone withBoardAnalyzer(findsWinner)
    ticTacToe isOver will == true
  ))

  it("knows it's over when there is a tie", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone withWinner(nil) withTie(true)
    ticTacToe         := TicTacToe clone withBoardAnalyzer(mockBoardAnalyzer)
    ticTacToe isOver will == true
  ))
  
  it("knows it's not over when there is no tie and no winner", block(
    mockBoardAnalyzer := MockBoardAnalyzer clone withTie(false) withWinner(nil)
    ticTacToe         := TicTacToe clone withBoardAnalyzer(mockBoardAnalyzer)
    ticTacToe isOver will == false
  ))
)
