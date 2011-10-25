MockPlayer := Object clone do(
  init := method(
    self moves := list()
  )
  
  withMoves := method(movesToUse,
    player := MockPlayer clone
    player moves = movesToUse
    player
  )
  
  getMove := method(moves removeAt(0))
)
