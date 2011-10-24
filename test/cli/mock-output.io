MockOutput := Object clone do(
  init := method(
    self numberOfTimesWasAskedForMove := 0
    self askedToShowResults           := false
    self boardToShow                  := nil
    self winnerToShow                 := nil
  )
  
  askForMoveOn := method(board, turn,
    numberOfTimesWasAskedForMove = numberOfTimesWasAskedForMove + 1
  )
  
  showResults := method(board, winner,
    askedToShowResults  = true
    boardToShow         = board
    winnerToShow        = winner
  )
  
  wasAskedToShowResultsWith := method(boardString, winnerNumber,
    (boardString == boardToShow asString) and (winnerNumber == winnerToShow)
  )
  
)
