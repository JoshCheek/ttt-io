doRelativeFile("test_helper.io")
doFile("lib/tic_tac_toe.io")

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
)
