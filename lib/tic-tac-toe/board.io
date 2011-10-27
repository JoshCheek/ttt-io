Board := Object clone do(

  init := method(
    self _primative := nil
    self undos      := list()
    withString("000000000")
  )
    
  asString := method(_primative join)
  
  mark := method(position, playerNumber,
    position := toPrivateIndex(position)
    _undo := list(position, _primative at(position))
    undos append(_undo)
    _primative atPut(position, markerFor(playerNumber))
    self
  )
  
  undo := method(
    _undo := undos pop
    position := _undo at(0)
    marker   := _undo at(1)
    _primative atPut(position, marker)
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
  
  humanReadable := method(board,
    ("   |   |   \n" ..
    " " .. (markerAt(0)) .. " | " .. (markerAt(1)) .. " | " .. (markerAt(2)) .. " \n" ..
    "   |   |   \n" ..
    "-----------\n" ..
    "   |   |   \n" ..
    " " .. (markerAt(3)) .. " | " .. (markerAt(4)) .. " | " .. (markerAt(5)) .. " \n" ..
    "   |   |   \n" ..
    "-----------\n" ..
    "   |   |   \n" ..
    " " .. (markerAt(6)) .. " | " .. (markerAt(7)) .. " | " .. (markerAt(8)) .. " \n" ..
    "   |   |   \n")
  )
  
  markerAt := method(privateIndex,
    playerNumberToMarker(_primative at(privateIndex))
  )
  
  playerNumberToMarker := method(playerNumber,
    if(playerNumber == 1) then(return "X") elseif(playerNumber == 2) then(return "O") else(return " ")
  )
  
  isEmpty := method(
    availablePositions size == 9
  )
  
  isFull := method(
    availablePositions isEmpty
  )
)
