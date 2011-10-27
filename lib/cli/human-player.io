hasSlot("Cli") ifFalse(Cli := Object clone)

Cli HumanPlayer := Object clone do(
  getMove := method(game, input, output,
    board := game board
    positions := board availablePositions
    output askForMoveOn(board, game turn)
    move := input getMove(positions)
    if(positions contains(move), return move)
    output alertInvalid
    getMove(game, input, output)
  )
)
