hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Driver := Object clone do(
  init := method(
    self board        := Board clone
    self game         := TicTacToe forBoard(board)
    self input        := Cli Input clone
    self output       := Cli Output clone
    self player1      := Cli HumanPlayer clone
    self player2      := Cli HumanPlayer clone
  )
  
  withPlayer1 := method(_player1, player1 = _player1; self)
  
  withPlayer2 := method(_player2, player2 = _player2; self)
  
  withInput  := method(_input,  input = _input; self)
  
  withOutput := method(_output, output = _output; self)
  
  withBoard  := method(_board,
    board = _board
    game = TicTacToe forBoard(board)
    self
  )
  
  drive := method(
    while(game isOver not, takeTurn)
    notifyResults
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
