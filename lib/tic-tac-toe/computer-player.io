ComputerPlayer := Object clone do(
  init := method(
    self _game := nil
    self _board := nil
    self turn  := nil
    self getMove := method(
      if(hasUrgentMove,
        urgentMove,
        bestMove(_board, turn) 
      )      
    )
  )
  
  withGame := method(game,
    player := ComputerPlayer clone
    player _game := game
    player _board := game board
    player turn  := game turn
    player
  )
  
  getMove := method(game,
    ComputerPlayer withGame(game) getMove
  )
  
  hasUrgentMove := method(urgentMove not not)
  
  urgentMove := method(board, turn,
    if(canWin) then(return winningMove) elseif(canLose) then(return losingMove)
  )
  
  canWin := method(winningMove not not)
  
  winningMove := method(
    _board availablePositions foreach(position,
      if(canWinAt(position), return position)
    )
    nil
  )
  
  canWinAt := method(position,
    _board mark(position, turn)
    hasWinner := BoardAnalyzer forBoard(_board) winner
    _board undo
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
    positions := board availablePositions
    ratings   := positions map(index, position,
      board mark(position, turn)
      r := Rating forBoard(board, TicTacToe nextTurn(turn), false) rateFor(turn)
      board undo
      r
    )
    maxPosition := positions first
    maxRating   := ratings first
    positions foreach(index, currentPosition,
      currentRating := ratings at(index)
      if(currentRating > maxRating,
        maxRating   = currentRating
        maxPosition = currentPosition
      )
    )
    maxPosition
  )
  
  
  
  Rating := Object clone do(
    
    shouldPrint := false
    
    init := method(
      self board      := nil
      self turn       := nil
      self isComputer := false
    )
    
    forBoard := method(_board, _turn, _isComputer,
      rating            := ComputerPlayer Rating clone
      rating board      := _board
      rating turn       := _turn
      rating isComputer := _isComputer
      if(_board asString == "122000011", shouldPrint = true)
      rating
    )
    
    asString := method(
      "(BOARD: ".. board ..", TURN: " .. turn .. ", ISCOMPUTER: " .. isComputer .. ")"
    )
        
    rateFor := method(currentTurn,
      if(isLeaf, return leafValue)
      ratings := childRatings
      
      if(isComputer,
        ratings max,
        ratings min
      )
    )
        
    isLeaf := method(TicTacToe forBoard(board) isOver)
    
    childRatings := method(
      ratings := list()
      board availablePositions foreach(position,
        board mark(position, turn)
        ratings append(ComputerPlayer Rating forBoard(board, opponent, isComputer not) rateFor(opponent))
        board undo
      )
      ratings 
    )
    
    opponent := method(TicTacToe nextTurn(turn))
    
    leafValue := method(
      winner := BoardAnalyzer forBoard(board) winner
      if(winner not, return 0)
      if(isComputer,
        if(winner == turn, return 1, return -1),
        if(winner == turn, return -1, return 1)
      )              
    )
  )
)
