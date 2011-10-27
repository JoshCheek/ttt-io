doRelativeFile("test-helper.io")

TestHelper gameFromString := method(boardString,
  board := Board forString(boardString)
  TicTacToe forBoard(board)  
)

describe("ComputerPlayer",
  
  it("has a factory to create with a game",
    game := TestHelper gameFromString("120000000")
    player := ComputerPlayer withGame(game)
    player turn will == 1
    player _board will == game board
  )
  
  # takes immediate wins
  it("takes a win when it can win across top",
    game := TestHelper gameFromString("110200200")
    ComputerPlayer getMove(game) will == 3
  )
  
  it("takes a win when it can win across bottom and opponent can win across top",
    game := TestHelper gameFromString("220000110")
    ComputerPlayer getMove(game) will == 9
  )
  
  it("takes a win when it can win vertically on RHS opponent can win too",
    game := TestHelper gameFromString("201201000")
    ComputerPlayer getMove(game) will == 9
  )
  
  it("takes a win when it can win vertically on LHS opponent can win too",
    game := TestHelper gameFromString("120120000")
    ComputerPlayer getMove(game) will == 7
  )
  
  it("takes a win when it can win diagonally",
    game := TestHelper gameFromString("102210000")
    ComputerPlayer getMove(game) will == 9
  )
  
  it("takes a win when it can win in two positions",
    game := TestHelper gameFromString("120112020")
    move := ComputerPlayer getMove(game)
    list(7, 9) contains(move) will == true
  )
  
  it("takes a win when it is 2nd player and 1st can also win",
    game := TestHelper gameFromString("120021001")
    ComputerPlayer getMove(game) will == 8
  )
  
  # blocks immediate losses
  it("blocks LHS",
    game := TestHelper gameFromString("120100000")
    ComputerPlayer getMove(game) will == 7
  )
  
  it("blocks either of opponent's possible wins",
    game := TestHelper gameFromString("122110000")
    move := ComputerPlayer getMove(game)
    list(6, 7, 9) contains(move) will == true
  )
  
  it("blocks when first player",
    game := TestHelper gameFromString("211200000")
    ComputerPlayer getMove(game) will == 7
  )
  
  # 'Finds best moves for likely game states'
  it("makes best 1st move",
    game := TestHelper gameFromString("000000000")
    move := ComputerPlayer getMove(game)
    list(1, 3, 7, 9) contains(move) will == true
  )
  
  it("makes move that will guarantee win in future",
    game := TestHelper gameFromString("120000000")
    move := ComputerPlayer getMove(game)
    list(4, 5, 7) contains(move) will == true
  )
  
  it("makes move that will guarantee win in future",
    game := TestHelper gameFromString("100000002")
    move := ComputerPlayer getMove(game)
    list(3, 5, 7) contains(move) will == true
  )
  
  it("makes move that will guarantee win in future",
    game := TestHelper gameFromString("100000020")
    move := ComputerPlayer getMove(game)
    list(3, 5, 7) contains(move) will == true
  )
  
  it("makes move that will guarantee win in future",
    game := TestHelper gameFromString("102000000")
    move := ComputerPlayer getMove(game)
    list(4, 7, 9) contains(move) will == true
  )
  
  
  it("makes move with highest probability of win in future",
    game := TestHelper gameFromString("100020000")
    move := ComputerPlayer getMove(game)
    list(2, 5) contains(move) will == true
  )
  
  it("makes move with lowest probability of losing in future",
    game := TestHelper gameFromString("100000000")
    ComputerPlayer getMove(game) will == 5
  )
)