hasSlot("Cli") ifFalse(Cli := Object clone)

Cli Driver := Object clone do(
  init := method(
    self board  := Board clone
    self game   := TicTacToe forBoard(board)
    self input  := Cli Input clone
    self output := Cli Output clone
  )
  
  withInput  := method(_input,  input = _input; self)
  
  withOutput := method(_output, output = _output; self)
  
  withBoard  := method(_board,
    board = if(_board type == "Sequence",
      Board forString(_board),
      _board
    )
    game = TicTacToe forBoard(board)
    self
  )
  
  drive := method(
    while(game isOver not,
      takeTurn
      notifyResults
    )
    self
  )
  
  takeTurn := method(
    output askForMoveOn(board, turn)
    game move(input getMove)
  )
  
  turn := method(game turn)
  
  notifyResults := method(output showResults(board, game winner))
)
