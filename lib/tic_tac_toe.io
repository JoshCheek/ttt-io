doFile("lib/tic_tac_toe/board.io")
TicTacToe := Object clone do(
  init := method(
    self board  := Board clone
    self isOver := method(board isOver)
    self isTie  := method(board isTie)
    self turn   := 1
    self move   := method(position,
      board mark(position, turn)
      self turn = if(turn == 1, 2, 1)
    )    
  )
)
