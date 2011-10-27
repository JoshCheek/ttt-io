MockOutput := Object clone do(
  init := method(
    self numberOfTimesWasAskedForMove       := 0
    self numberOfTimesWasAskedToShowResults := 0
    self promptedToGoFirstOrSecond          := false
    self askedToShowResults                 := false
    self boardToShow                        := nil
    self winnerToShow                       := nil
  )
  
  askForMoveOn := method(board, turn,
    numberOfTimesWasAskedForMove = numberOfTimesWasAskedForMove + 1
  )
  
  showResults := method(board, winner,
    numberOfTimesWasAskedToShowResults  = numberOfTimesWasAskedToShowResults + 1
    askedToShowResults                  = true
    boardToShow                         = board
    winnerToShow                        = winner
  )
  
  wasAskedToShowResultsWith := method(boardString, winnerNumber,
    (boardString == boardToShow asString) and (winnerNumber == winnerToShow)
  )
  
  wasNotAskedToShowResults := method(numberOfTimesWasAskedToShowResults == 0)  
  
  goFirstOrSecond := method(
    promptedToGoFirstOrSecond = true
    self
  )  
)
