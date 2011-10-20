Board := Object clone do(
  
  asString := method(_primative join)
  
  mark := method(position, playerNumber, 
    _primative atPut(position-1, markerFor(playerNumber))
    self
  )
  
  markerFor := method(playerNumber, playerNumber)
  
  isOver := method(isTie or winner)
  
  winner := method(
    boardAnalyzer winnerFor(self) 
  )
  
  boardAnalyzer := method(
    _boardAnalyzer ifNil(_boardAnalyzer = BoardAnalyzer clone)
    _boardAnalyzer
  )
  
  withBoardAnalyzer := method(newBoardAnalyzer,
    _boardAnalyzer = newBoardAnalyzer
    self
  )
  
  fromString := method(newString,
    _primative = newString asList map(element, element asNumber)
    self
  )
  
  isTie := method(availablePositions isEmpty)
  
  availablePositions := method(
    toReturn := list()
    _primative foreach(index, element, if(element == 0, toReturn append(index)))
    toReturn
  )
  
  init := method(
    self _primative     := nil
    self _boardAnalyzer := nil
    fromString("000000000")
  )
)
