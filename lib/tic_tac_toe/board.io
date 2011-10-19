Board := Object clone do(
  
  asString := method(self string)
  
  mark := method(position, playerNumber, 
    string atPut(position-1, markerFor(playerNumber))
    self
  )
  
  markerFor := method(playerNumber, playerNumber asString at(0))
  
  init := method(
    self string   := "000000000" asMutable
    self isOver   := false
    self isTie    := false
  )
)
