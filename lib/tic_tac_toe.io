doFile("lib/tic_tac_toe/board.io")
TicTacToe := Object clone do(
  board  := Board clone
  isOver := method(board isOver)
  isTie  := method(board isTie)
  turn   := 1
  move := method(position, self turn = if(turn == 1, 2, 1))
)
