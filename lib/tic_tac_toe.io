doFile("lib/tic_tac_toe/board.io")
TicTacToe := Object clone do(
  board  := Board clone
  isOver := method(board isOver)
  isTie  := method(board isTie)
)
