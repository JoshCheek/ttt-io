MockBoardAnalyzer := Object clone do(
  init := method(
    self winner := nil
    self tie    := nil
  )
  
  withWinner := method(newWinner, winner = newWinner; self)
  
  withTie := method(newTieResult, tie = newTieResult; self)
  
  isTie := method(tie)
)
