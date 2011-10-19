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
    ttt := TicTacToe clone setBoard(MockBoard clone)
    ttt turn will == 1
    ttt move(1)
    ttt turn will == 2
    ttt move(2)
    ttt turn will == 1
  ))
  
  it("marks its moves on the board", block(
    ttt := TicTacToe clone setBoard(MockBoard clone)
    ttt board wasMarked(9, 1) will == false
    ttt move(9)
    ttt board wasMarked(9, 1) will == true
  ))
  
  it("knows when it is over", block(
    board := MockBoard clone
    newGame := TicTacToe clone setBoard(board)
    board wasAskedIfIsOver will == false
    newGame isOver will == false
    board wasAskedIfIsOver will == true
    
    finishedGame := TicTacToe clone setBoard(MockBoard clone setIsOver(true))
    finishedGame isOver will == true
  ))
)
