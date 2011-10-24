doFile("lib/tic-tac-toe/board.io")
doFile("lib/tic-tac-toe/board-analyzer.io")

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
    _boardAnalyzer ifNil(_boardAnalyzer = BoardAnalyzer forBoard(board))
    _boardAnalyzer
  )
  
  
  withBoard := method(newBoard,
    _board = newBoard
    self
  )
  
  forBoard := method(newBoard, TicTacToe clone withBoard(newBoard))
  
  withBoardAnalyzer := method(newBoardAnalyzer,
    _boardAnalyzer = newBoardAnalyzer
    self
  )
)
