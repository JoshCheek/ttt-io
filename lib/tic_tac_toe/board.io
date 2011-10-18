Board := Object clone do(  
  init := method(
    self string   := "000000000" asMutable
    self asString := method(self string)
    self isOver   := false
    self isTie    := false
    self mark     := method(position, playerNumber, 
      string atPut(position-1, markerFor(playerNumber))
    )
    self markerFor := method(playerNumber, playerNumber asString at(0))
  )
)
