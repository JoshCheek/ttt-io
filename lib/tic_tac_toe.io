doFile("lib/tic_tac_toe/board.io")

TicTacToe := Object clone do(
  init := method(
    self _board  := nil
    self turn   := 1
  )
  
  isOver := method(board isOver)
  
  isTie  := method(board isTie)
  
  move   := method(position,
    board mark(position, turn)
    self turn = if(turn == 1, 2, 1)
  )
  
  board := method(
    if(_board isNil, _board = Board clone)
    _board
  )
)
