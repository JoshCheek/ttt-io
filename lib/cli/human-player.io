hasSlot("Cli") ifFalse(Cli := Object clone)

Cli HumanPlayer := Object clone do(
  getMove := method(game, input, output,
    output askForMoveOn(game board, game turn)
    input getMove
  )
)
