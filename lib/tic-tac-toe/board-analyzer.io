BoardAnalyzer := Object clone do(
  init := method(
    self board := nil
  )
  
  winningPositions := list(
    list(1, 2, 3),
    list(4, 5, 6),
    list(7, 8 ,9),
    list(1, 4, 7),
    list(2, 5, 8),
    list(3, 6, 9),
    list(1, 5, 9),
    list(3, 5, 7)
  )
  
  withBoard := method(board, 
    self board = board
    self
  )
  
  forBoard := method(board, BoardAnalyzer clone withBoard(board))
  
  isTie := method(noWinner and nowhereToMove)
  
  noWinner := method(if(winner, false, true))
  
  winner := method(
    winningPositions foreach(positions,
      winner := winnerOn(positions, board)
      if(winner, return winner)
    )
    nil
  )
  
  winnerOn := method(positions, board,
    player1 := board playerAt(positions at(0))
    player2 := board playerAt(positions at(1))
    player3 := board playerAt(positions at(2))
    if(player1 == player2 and player2 == player3, player1, nil)
  )
  
  nowhereToMove := method(board availablePositions isEmpty)
)
