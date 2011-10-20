doFile("lib/tic_tac_toe/board.io")

TicTacToe := Object clone do(
  init := method(
    self _board := nil
    self _boardAnalyzer := nil
    self turn   := 1
  )
  
  isOver := method(isTie or winner)
  
  isTie := method(boardAnalyzer isTie)
  
  winner := method(boardAnalyzer winner)
    
  move := method(position,
    board mark(position, turn)
    self turn = if(turn == 1, 2, 1)
    self
  )
  
  board := method(
    _board ifNil(_board = Board clone)
    _board
  )
    
  boardAnalyzer := method(
    _boardAnalyzer ifNil(_boardAnalyzer = BoardAnalyzer clone withBoard(board))
    _boardAnalyzer
  )
  
  
  withBoard := method(new_board,
    _board = new_board
    self
  )
  
  withBoardAnalyzer := method(newBoardAnalyzer,
    _boardAnalyzer = newBoardAnalyzer
    self
  )
)
