MockBoard := Object clone do(
  init := method(
    self marks := list()
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
