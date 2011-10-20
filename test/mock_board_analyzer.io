MockBoardAnalyzer := Object clone do(
  init := method(
    self _winner  := nil
    self _tie     := nil
    self board    := nil
  )
  
  wasAskedForWinnerFrom := method(stringBoard,
    stringBoard == board asString
  )
  
  setWinner := method(newWinner, _winner = newWinner; self)
  
  winnerFor := method(board, 
    self board = board
    _winner
  )
  
  withTie := method(newTieResult, _tie = newTieResult; self)
)
