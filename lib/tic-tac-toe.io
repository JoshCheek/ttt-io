doRelativeFile("tic-tac-toe/board.io")
doRelativeFile("tic-tac-toe/board-analyzer.io")
doRelativeFile("tic-tac-toe/computer-player.io")
doRelativeFile("cli/driver.io")
doRelativeFile("cli/input.io")
doRelativeFile("cli/output.io")
doRelativeFile("cli/human-player.io")

TicTacToe := Object clone do(
  init := method(
    self _board         := nil
    self _boardAnalyzer := nil
    self turn           := 1
  )
  
  isOver := method(isTie or winner)
  
  isTie := method(boardAnalyzer isTie)
  
  winner := method(boardAnalyzer winner)
    
  move := method(position,
    board mark(position, turn)
    turn = nextTurn(turn)
    self
  )
  
  nextTurn := method(turn, if(turn == 1, 2, 1))
  
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
    turn = if(newBoard availablePositions size isOdd, 1, 2)
    self
  )
  
  forBoard := method(newBoard, TicTacToe clone withBoard(newBoard))
  
  withBoardAnalyzer := method(newBoardAnalyzer,
    _boardAnalyzer = newBoardAnalyzer
    self
  )
)
