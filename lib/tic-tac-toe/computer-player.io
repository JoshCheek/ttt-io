ComputerPlayer := Object clone do(
  init := method(
    self _game := nil
    self board := nil
    self turn  := nil
    self getMove := method(
      if(urgentMove(board, turn),
        urgentMove(board, turn),
        bestMove(board, turn) 
      )      
    )
  )
  
  withGame := method(game,
    player := ComputerPlayer clone
    player _game := game
    player board := game board
    player turn  := game turn
    player
  )
  
  getMove := method(game,
    ComputerPlayer withGame(game) getMove
  )
  
  urgentMove := method(board, turn,
    if(canWin) then(return winningMove) elseif(canLose) then(return losingMove)
  )
  
  canWin := method(winningMove not not)
  
  winningMove := method(
    board availablePositions foreach(position,
      if(canWinAt(position), return position)
    )
    nil
  )
  
  canWinAt := method(position,
    board mark(position, turn)
    hasWinner := BoardAnalyzer forBoard(board) winner
    board undo
    hasWinner
  )
  
  canLose := method(losingMove not not)
  
  losingMove := method(
    advanceTurn
    move := winningMove
    advanceTurn
    move
  )
  
  advanceTurn := method(
    turn = _game nextTurn(turn)
    self
  )
  
  bestMove := method(board, turn,
    "NOT IMPLEMENTED"
  )
)
