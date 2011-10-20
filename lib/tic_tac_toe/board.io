Board := Object clone do(
  
  asString := method(_primative join)
  
  mark := method(position, playerNumber, 
    _primative atPut(position-1, markerFor(playerNumber))
    self
  )
  
  markerFor := method(playerNumber, playerNumber)
      
  fromString := method(newString,
    _primative = newString asList map(element, element asNumber)
    self
  )
  
  availablePositions := method(
    toReturn := list()
    _primative foreach(index, element, if(element == 0, toReturn append(index)))
    toReturn
  )
  
  playerAt := method(publicIndex,
    player := _primative at(toPrivateIndex(publicIndex))
    if(player == 0, nil, player)
  )
  
  toPrivateIndex := method(publicIndex, publicIndex-1)
  
  init := method(
    self _primative     := nil
    fromString("000000000")
  )
)
