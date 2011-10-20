MockBoardAnalyzer := Object clone do(
  init := method(
    self _winner := nil
  )
  
  setWinner := method(newWinner, _winner = newWinner; self)
  
  winnerFor := method(board, _winner)
)
