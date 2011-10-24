Board := Object clone do(
  
  asString := method(_primative join)
  
  mark := method(position, playerNumber, 
    _primative atPut(position-1, markerFor(playerNumber))
    self
  )
  
  markerFor := method(playerNumber, playerNumber)
  
  withString := method(newString,
    _primative = newString asList map(element, element asNumber)
    self
  )
  
  forString := method(newString, Board clone withString(newString))
  
  availablePositions := method(
    toReturn := list()
    _primative foreach(privateIndex, element,
      if(element == 0, toReturn append(toPublicIndex(privateIndex)))
    )
    toReturn
  )
  
  playerAt := method(publicIndex,
    player := _primative at(toPrivateIndex(publicIndex))
    if(player == 0, nil, player)
  )
  
  toPrivateIndex := method(publicIndex,  publicIndex-1)
  toPublicIndex  := method(privateIndex, privateIndex+1)
  
  init := method(
    self _primative := nil
    withString("000000000")
  )
)
