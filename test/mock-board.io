MockBoard := Object clone do(
  init := method(
    self marks            := list()
    self wasAskedIfIsOver := false
    self wasAskedIfIsTie  := false
    self _isOver          := false
    self _isTie           := false
  )

  setIsTie := method(newIsTie,
    _isTie = newIsTie
    self
  )
  
  isTie := method(
    wasAskedIfIsTie = true
    _isTie
  )
    
  setIsOver := method(newIsOver,
    _isOver = newIsOver
    self
  )
  
  isOver := method(
    wasAskedIfIsOver = true
    _isOver
  )
  
  mark := method(position, playerNumber,
    mark              := Object clone
    mark position     := position
    mark playerNumber := playerNumber
    marks append(mark)
    self
  )
  
  wasMarked := method(position, playerNumber,
    marks detect(mark,
      mark position == position and mark playerNumber == playerNumber
    ) not not
  )
)