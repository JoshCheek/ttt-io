hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Driver := Object clone do(
  init := method(
    self board            := Board clone
    self game             := TicTacToe forBoard(board)
    self input            := Cli Input clone
    self output           := Cli Output clone
    self playerOverride   := false
    self player1          := nil
    self player2          := nil
  )
  
  withPlayers := method(_player1, _player2,
    playerOverride = true
    player1 = _player1
    player2 = _player2
    self
  )
  
  withInput  := method(_input,  input = _input; self)
  
  withOutput := method(_output, output = _output; self)
  
  withBoard  := method(_board,
    board = _board
    game = TicTacToe forBoard(board)
    self
  )
  
  drive := method(
    if(playerOverride not, promptAndSetPlayers)
    while(game isOver not, takeTurn)
    notifyResults
    self
  )
  
  promptAndSetPlayers := method(
    output goFirstOrSecond
    human   := input goFirstOrSecond
    player1  = if(human == 1, Cli HumanPlayer clone, ComputerPlayer withGame(game))
    player2  = if(human == 2, Cli HumanPlayer clone, ComputerPlayer withGame(game) overrideTurn(2))
    self
  )
  
  takeTurn := method(
    game move(currentPlayer getMove(game, input, output))
    self
  )
  
  turn := method(game turn)
  
  currentPlayer := method(if(turn == 1, player1, player2))
  
  notifyResults := method(output showResults(board, game winner))
)
